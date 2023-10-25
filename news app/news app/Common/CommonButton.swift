//
//  CommonButton.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct CommonButton: View {
    var text: String
    @Binding var isEnable: Bool
    var action: () -> Void

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(text)
                    .font(AppConfig.font.medium18)
                    .foregroundColor(.white)
                    .padding(.vertical, AppConfig.layout.standardSpace)
                    .frame(maxWidth: .infinity)
                    .background(isEnable ? AppConfig.theme.btnEnableColor : AppConfig.theme.btnDisableColor)
                    .cornerRadius(AppConfig.layout.standardCornerRadius)
            }.disabled(!isEnable)
        }
    }
}

#Preview {
    CommonButton(text: "Sign in", isEnable: .constant(true), action: {})
}
