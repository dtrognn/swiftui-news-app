//
//  Image+Ext.swift
//  news app
//
//  Created by dtrognn on 27/10/2023.
//

import SwiftUI

public extension Image {
    func applyTheme(_ color: Color = AppConfig.theme.iconColor) -> some View {
        self.renderingMode(.template)
            .foregroundColor(color)
    }
}
