//
//  CommonSecureField.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct CommonSecureField: View {
    @Binding var text: String
    var placeholder: String

    @State private var isSecure: Bool = true

    var body: some View {
        VStack {
            ZStack {
                backgroundFrame

                ZStack(alignment: .trailing) {
                    if !isSecure {
                        textField
                    } else {
                        secureField
                    }

                    if !text.isEmpty {
                        showHiddenPassButton
                    }
                }.padding(.horizontal, AppConfig.layout.mediumSpace)
            }
        }
    }
}

private extension CommonSecureField {
    var textField: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .font(AppConfig.font.regular16)
            .autocapitalization(.none)
    }
    
    var secureField: some View {
        SecureField(placeholder, text: $text)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .font(AppConfig.font.regular16)
            .autocapitalization(.none)
            
    }

    var backgroundFrame: some View {
        RoundedRectangle(cornerRadius: AppConfig.layout.standardCornerRadius, style: .continuous)
            .stroke(AppConfig.theme.iconColor, lineWidth: AppConfig.layout.lineWidth)
            .frame(height: AppConfig.layout.standardTextFieldHeight)
    }

    var showHiddenPassButton: some View {
        Button {
            isSecure.toggle()
        } label: {
            Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.iconColor)
                .frame(width: 28, height: 18)
        }
    }
}

#Preview {
    CommonSecureField(text: .constant(""), placeholder: "Enter your password")
}
