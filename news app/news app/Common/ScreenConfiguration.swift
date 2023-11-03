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
    @Published public var hiddenTabbar: Bool
    @Published public var showUnderline: Bool

    public init(title: String, showBackButton: Bool = true, showNaviBar: Bool = true, hiddenTabbar: Bool = true, showUnderline: Bool = false) {
        self.title = title
        self.showBackButton = showBackButton
        self.showNaviBar = showNaviBar
        self.hiddenTabbar = hiddenTabbar
        self.showUnderline = showUnderline
    }
}
