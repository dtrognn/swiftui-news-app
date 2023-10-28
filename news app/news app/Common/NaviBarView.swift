//
//  NaviBarView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct NaviBarView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var screenConfiguration: ScreenConfiguration

    var body: some View {
        VStack(spacing: AppConfig.layout.zero) {
            HStack(spacing: AppConfig.layout.zero) {
                if screenConfiguration.showBackButton {
                    backButton
                }
                Spacer()
                titleText.padding(.vertical, AppConfig.layout.mediumSpace)
                Spacer()
                if screenConfiguration.showBackButton {
                    backButton.opacity(0)
                }
            }.padding(.top, AppConfig.layout.standardButtonHeight)
                .navigationBarHidden(true)
                .background(
                    Color.clear
                        .ignoresSafeArea(edges: .top))
            if screenConfiguration.showUnderline {
                StraightLine()
            }
        }.padding(.top, AppConfig.layout.standardSpace)
    }
}

private extension NaviBarView {
    var backButton: some View {
        return Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .frame(width: AppConfig.layout.standardButtonHeight, height: AppConfig.layout.standardButtonHeight)
                .foregroundColor(AppConfig.theme.textNormalColor)
        }
    }

    var titleText: some View {
        return Text(screenConfiguration.title)
            .foregroundColor(AppConfig.theme.naviTextColor)
            .font(AppConfig.font.semibold16)
    }
}

#Preview {
    NaviBarView(screenConfiguration: ScreenConfiguration(title: "Dtrong"))
}
