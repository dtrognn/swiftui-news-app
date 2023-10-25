//
//  LoginVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Combine
import Foundation

class LoginVM: FirebaseManager {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEnableButton: Bool = false

    var onNextScreen = PassthroughSubject<Void, Never>()

    override func makeSubscription() {
        Publishers.CombineLatest($email, $password).map { email, password in
            email.count >= 1 && password.count >= 6
        }.assign(to: &$isEnableButton)
    }

    func login() {
        showLoading(true)
        login(with: email, password: password) { [weak self] result in
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
        print("AAA login failed: \(error.localizedDescription)")
    }
}
