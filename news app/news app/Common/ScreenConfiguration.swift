//
//  ScreenConfiguration.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation

public class ScreenConfiguration: ObservableObject {
    @Published public var title: String
    @Published public var showBackButton: Bool
    @Published public var showNaviBar: Bool
    
    public init(title: String, showBackButton: Bool = true, showNaviBar: Bool = true) {
        self.title = title
        self.showBackButton = showBackButton
        self.showNaviBar = showNaviBar
    }
}
