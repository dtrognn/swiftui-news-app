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

    override func makeSubscription() {
        Publishers.CombineLatest($email, $password).map { email, password in
            email.count >= 1 && password.count >= 6
        }.assign(to: &$isEnableButton)
    }
}
