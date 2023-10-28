//
//  ProgressView+Ext.swift
//  news app
//
//  Created by dtrognn on 28/10/2023.
//

import SwiftUI

public extension ProgressView {
    func applyTheme(_ color: Color = AppConfig.theme.iconColor) -> some View {
        self.foregroundColor(color)
    }
}
