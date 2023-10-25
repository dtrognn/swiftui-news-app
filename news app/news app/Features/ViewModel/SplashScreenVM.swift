//
//  SplashScreenVM.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Combine
import FirebaseAuth
import Foundation

class SplashScreenVM: BaseVM {
    var onLoggedIn = PassthroughSubject<Bool, Never>()

    func handleAppState() {
        showLoading(true)
        FirebaseManager.shared.$userSession.sink { user in
            let isLoggedIn = user != nil
            self.onLoggedIn.send(isLoggedIn)
            self.showLoading(false)
        }.store(in: &cancellableSet)
    }
}
