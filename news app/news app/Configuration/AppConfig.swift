//
//  AppConfig.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation

public struct AppConfig {
    public static var font: INewsFont = NewsFont()
    public static var theme: INewsTheme = NewsTheme()
    public static var layout: INewsLayout = NewsLayout()

    public init() {}
}
