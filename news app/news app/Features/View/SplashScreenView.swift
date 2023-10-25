//
//  SplashScreenView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject private var appSceneRouter: AppSceneRouter
    
    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "", showBackButton: false, showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            VStack {
                Spacer()
                Text("Splash Screen")
                Spacer()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring()) {
                    appSceneRouter.rootView = .login
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
