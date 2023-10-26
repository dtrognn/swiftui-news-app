//
//  FirebaseManager.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class FirebaseManager: BaseVM {
    static let shared = FirebaseManager()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    override init() {
        super.init()
        self.userSession = Auth.auth().currentUser
    }
    
    private let COLLECTION_USER = Firestore.firestore().collection("users")
    
    func register(with email: String, password: String, fullname: String, complete: @escaping (_ result: Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let result = result else { return }
                
                self.userSession = result.user
                self.storageUser(user: result.user, fullname: fullname, email: email)
                
                complete(.success(true))
            }
        }
    }
    
    private func storageUser(user: FirebaseAuth.User, fullname: String, email: String) {
        let user = User(uid: user.uid, fullname: fullname, email: email, created: "")
        self.COLLECTION_USER.document(user.uid).setData(user.toDict)
    }

    func login(with email: String, password: String, complete: @escaping (_ result: Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                complete(.failure(error))
            } else {
                guard let result = result else { return }
                self.userSession = result.user
                complete(.success(true))
            }
        }
    }
    
    func getUserInfo(complete: @escaping (_ result: Result<User, Error>) -> Void) {
        guard let uid = userSession?.uid else { return }
        self.COLLECTION_USER.document(uid).getDocument { document, error in
            if let error = error {
                complete(.failure(error))
                return
            }
            
            if let document = document,
               let fullname = document.get("fullname") as? String,
               let email = document.get("email") as? String,
               let create = document.get("created") as? String
            {
                let user = User(uid: uid, fullname: fullname, email: email, created: create)
                complete(.success(user))
            }
        }
    }
    
    func logOut(complete: @escaping (_ result: Result<Bool, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            complete(.success(true))
        } catch {
            complete(.failure(error))
        }
    }
}
