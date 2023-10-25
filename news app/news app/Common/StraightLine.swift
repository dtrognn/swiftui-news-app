//
//  StraightLine.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

public struct StraightLine: View {
    public init() {}

    public var body: some View {
        Divider().frame(height: 1)
            .foregroundColor(AppConfig.theme.lineColor)
    }
}
