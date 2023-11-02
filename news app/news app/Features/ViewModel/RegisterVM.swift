//
//  RegisterVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Combine
import Foundation

class RegisterVM: FirebaseManager {
    @Published var fullname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isEnableButton: Bool = true
    @Published var isShowError: Bool = false
    @Published var errorMessage: String = ""

    var onNextScreen = PassthroughSubject<Void, Never>()

    func register() {
        showLoading(true)
        register(with: email, password: password, fullname: fullname) { [weak self] result in
            self?.showLoading(false)
            switch result {
            case .success:
                self?.onNextScreen.send(())
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }

    func handleError(_ error: Error) {
        print("AAA register error: \(error.localizedDescription)")
        errorMessage = error.localizedDescription
        isShowError = true
    }
}
