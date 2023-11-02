//
//  RowCommonView.swift
//  news app
//
//  Created by dtrognn on 02/11/2023.
//

import SwiftUI

struct RowCommonView: View {
    var image: String
    var title: String
    var isShowArrow = true
    var onAction: () -> Void

    var body: some View {
        Button {
            onAction()
        } label: {
            VStack(spacing: AppConfig.layout.zero) {
                VStack(spacing: AppConfig.layout.zero) {
                    HStack(spacing: AppConfig.layout.zero) {
                        HStack(spacing: AppConfig.layout.mediumSpace) {
                            leftImage
                            titleText
                        }
                        Spacer()
                        if isShowArrow {
                            arrowImage
                        }
                    }.padding(.all, AppConfig.layout.standardSpace)
                    StraightLine().padding(.horizontal, AppConfig.layout.standardSpace)
                }
            }.background(AppConfig.theme.rowCommonBackgroundColor)
        }
    }
}

private extension RowCommonView {
    var leftImage: some View {
        return Image(systemName: image)
            .applyTheme()
    }

    var titleText: some View {
        return Text(title)
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var arrowImage: some View {
        return Image(systemName: "chevron.right")
            .applyTheme()
    }
}

#Preview {
    RowCommonView(image: "bookmark.fill", title: "Bookmark", onAction: {})
}
