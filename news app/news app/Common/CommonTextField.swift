//
//  CommonTextField.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct CommonTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        VStack {
            ZStack {
                backgroundFrame

                ZStack(alignment: .trailing) {
                    textField

                    if !text.isEmpty {
                        clearButton
                    }
                }.padding(.horizontal, AppConfig.layout.mediumSpace)
            }
        }
    }
}

private extension CommonTextField {
    var textField: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .font(AppConfig.font.regular16)
            .autocapitalization(.none)
    }
    
    var backgroundFrame: some View {
        RoundedRectangle(cornerRadius: AppConfig.layout.standardCornerRadius, style: .continuous)
            .stroke(AppConfig.theme.iconColor, lineWidth: AppConfig.layout.lineWidth)
            .frame(height: AppConfig.layout.standardTextFieldHeight)
    }

    var clearButton: some View {
        Button {
            text = ""
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.iconColor)
                .frame(width: 24, height: 24)
        }
    }
}
#Preview {
    CommonTextField(text: .constant(""), placeholder: "Enter your email")
}
