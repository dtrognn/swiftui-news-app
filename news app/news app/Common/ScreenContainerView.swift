//
//  ScreenContainerView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct ScreenContainerView<Content: View>: View {
    @ObservedObject var screenConfiguration: ScreenConfiguration
    private var content: () -> Content

    init(screenConfiguration: ScreenConfiguration, content: @escaping () -> Content) {
        self.screenConfiguration = screenConfiguration
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .top) {
            AppConfig.theme.backgroundColor

            VStack(spacing: AppConfig.layout.zero) {
                if screenConfiguration.showNaviBar {
                    NaviBarView(screenConfiguration: screenConfiguration)
                }
                content()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ScreenContainerView(screenConfiguration: ScreenConfiguration(title: "Dtrognn")) {
        Text("")
    }
}
