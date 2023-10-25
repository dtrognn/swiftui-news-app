//
//  FirebaseManager.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import FirebaseAuth
import Foundation

class FirebaseManager: BaseVM {
    func register<T>(with email: String, password: String, complete: @escaping (_ result: Result<T, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let result = result as? T else { return }
                complete(.success(result))
            }
        }
    }

    func login<T>(with email: String, password: String, complete: @escaping (_ result: Result<T, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let result = result as? T else { return }
                complete(.success(result))
            }
        }
    }
}
