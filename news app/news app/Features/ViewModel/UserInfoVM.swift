//
//  UserInfoVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Combine
import Foundation

class UserInfoVM: FirebaseManager {
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

    private func handleError(_ error: Error) {
        print("AAA log out failed: \(error.localizedDescription)")
    }
}
