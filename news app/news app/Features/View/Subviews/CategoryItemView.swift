//
//  CategoryItemView.swift
//  news app
//
//  Created by dtrognn on 30/10/2023.
//

import SwiftUI

struct CategoryItemView: View {
    var category: Catergory
    var isSelected: Bool
    var onAction: (Catergory) -> Void

    var body: some View {
        Button {
            onAction(category)
        } label: {
            Text(category.rawValue)
                .font(AppConfig.font.regular14)
                .foregroundColor(isSelected ? AppConfig.theme.whiteTextColor : AppConfig.theme.textNormalColor)
                .padding(.horizontal, AppConfig.layout.mediumSpace)
                .padding(.vertical, AppConfig.layout.smallSpace)
                .background(isSelected ? AppConfig.theme.btnEnableColor : AppConfig.theme.lineColor)
                .cornerRadius(AppConfig.layout.standardCornerRadius)
        }
    }
}

#Preview {
    CategoryItemView(category: .general, isSelected: true, onAction: { _ in })
}
