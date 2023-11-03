//
//  news_appApp.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

@main
struct news_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appSceneRouter = AppSceneRouter()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    switch appSceneRouter.rootView {
                    case .splash:
                        SplashScreenView()
                    case .login:
                        LoginView()
                    case .tabview:
                        MainTabView()
                    }
                }
            }.environmentObject(appSceneRouter)
        }
    }
}
