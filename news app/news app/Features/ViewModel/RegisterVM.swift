//
//  RegisterVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation
import Combine

class RegisterVM: FirebaseManager {
    @Published var fullname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isEnableButton: Bool = false
}
