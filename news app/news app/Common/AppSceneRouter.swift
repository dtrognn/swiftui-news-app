//
//  AppSceneRouter.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation

final class AppSceneRouter: ObservableObject {
    enum Root {
        case splash
        case login
        case tabview
    }
    
    @Published var rootView: Root = .splash
}
