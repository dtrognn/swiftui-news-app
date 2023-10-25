//
//  RegisterView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var vm = RegisterVM()

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "", showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: AppConfig.layout.standardSpace) {
                    Group {
                        VStack(alignment: .trailing, spacing: AppConfig.layout.standardSpace) {
                            VStack(spacing: AppConfig.layout.standardSpace) {
                                fullnameView
                                emailView
                                passwordView
                                confirmPasswordView
                            }

                            registerButton
                        }
                    }
                    
                    Spacer()
                    
                    backToLoginButton
                }.padding(.top, AppConfig.layout.hugeSpace * 2)
                    .padding(.horizontal, AppConfig.layout.standardSpace)
            }
        }
    }
}

private extension RegisterView {
    var registerButton: some View {
        return CommonButton(text: "Register", isEnable: $vm.isEnableButton) {
            // TODO: - Handle login
        }
    }

    var backToLoginButton: some View {
        return Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Have an account? Login")
                .font(AppConfig.font.regular16)
                .foregroundColor(AppConfig.theme.textUnderlineColor)
                .underline()
        }
    }

    var fullnameTextField: some View {
        return CommonTextField(text: $vm.fullname, placeholder: "Enter your fullname")
    }

    var emailTextField: some View {
        return CommonTextField(text: $vm.email, placeholder: "Enter your email")
    }

    var passwordTextField: some View {
        return CommonSecureField(text: $vm.password, placeholder: "Enter your password")
    }

    var confirmPassTextField: some View {
        return CommonSecureField(text: $vm.confirmPassword, placeholder: "Enter confirm password")
    }

    var fullnameView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            fullnameText
            fullnameTextField
        }
    }

    var emailView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            emailText
            emailTextField
        }
    }

    var passwordView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            passwordText
            passwordTextField
        }
    }

    var confirmPasswordView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            conirmPassText
            confirmPassTextField
        }
    }

    var emailText: some View {
        return Text("Email")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var passwordText: some View {
        return Text("Password")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var fullnameText: some View {
        return Text("Fullname")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var conirmPassText: some View {
        return Text("Confirm password")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }
}

#Preview {
    RegisterView()
}
