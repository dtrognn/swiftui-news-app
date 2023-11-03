//
//  UserInfoVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Combine
import Foundation

enum AlertType {
    case none
    case logout
    case deleteAccount
}

class UserInfoVM: FirebaseManager {
    @Published var alertType: AlertType = .none
    @Published var errorMessage: String = ""
    @Published var user: User?
    var onNextScreen = PassthroughSubject<Void, Never>()

    func logOut() {
        showLoading(true)
        logOut { [weak self] result in
            self?.showLoading(false)
            switch result {
            case .success:
                self?.onNextScreen.send(())
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }

    func fetchData() {
        showLoading(true)
        getUserInfo { [weak self] result in
            self?.showLoading(false)
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }

    func deleteUser() {
        showLoading(true)
        deleteUser { [weak self] result in
            self?.showLoading(false)
            switch result {
            case .success:
                self?.onNextScreen.send(())
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }

    private func handleError(_ error: Error) {
        print("AAA log out failed: \(error.localizedDescription)")
        errorMessage = error.localizedDescription
    }
}
