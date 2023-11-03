//
//  SplashScreenView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject private var appSceneRouter: AppSceneRouter
    @StateObject private var vm = SplashScreenVM()

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "", showBackButton: false, showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            VStack {
                Spacer()
                logoImage
                Spacer()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                vm.handleAppState()
            }
        }.onReceive(vm.onLoggedIn) { value in
            if value {
                appSceneRouter.rootView = .tabview
            } else {
                appSceneRouter.rootView = .login
            }
        }
    }
    
    var logoImage: some View {
        return LogoView()
    }
}

#Preview {
    SplashScreenView()
}
