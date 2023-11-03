//
//  LoginView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appSceneRouter: AppSceneRouter
    @StateObject private var vm = LoginVM()
    
    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "", showNaviBar: false)
    }
    
    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: AppConfig.layout.zero) {
                    logoImage
                    VStack(spacing: AppConfig.layout.standardSpace) {
                        Group {
                            VStack(alignment: .trailing, spacing: AppConfig.layout.standardSpace) {
                                VStack(spacing: AppConfig.layout.standardSpace) {
                                    emailView
                                    passwordView
                                }
                                HStack(spacing: AppConfig.layout.zero) {
                                    registerButton
                                    Spacer()
                                    forgotPasswordButton
                                }
                                loginButton
                            }
                        }
                        orLoginWithText
                        loginSocial
                    }.padding(.horizontal, AppConfig.layout.standardSpace)
                }.padding(.top, AppConfig.layout.hugeSpace * 2)
            }.onReceive(vm.onNextScreen) { _ in
                appSceneRouter.rootView = .tabview
            }.alertView(alertConfiguration)
        }.environmentObject(appSceneRouter)
    }
}

private extension LoginView {
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
    
    var loginButton: some View {
        return CommonButton(text: "Login", isEnable: $vm.isEnableButton) {
            vm.login()
        }
    }
    
    var fbLogin: some View {
        return Button {
            // TODO: - Handle login with facebook
        } label: {
            Image("facebook")
        }
    }
    
    var ggLogin: some View {
        return Button {
            // TODO: - Handle login with google
        } label: {
            Image("google")
        }
    }
    
    var appleLogin: some View {
        return Button {
            // TODO: - Handle login with apple
        } label: {
            Image("apple")
        }
    }
    
    var alertConfiguration: AlertConfiguration {
        return AlertConfiguration(isPresented: $vm.isShowError,
                                  title: "Error",
                                  message: vm.errorMessage,
                                  primaryButtonText: "Close") {} secondaryAction: {}
    }
    
    var emailTextField: some View {
        return CommonTextField(text: $vm.email, placeholder: "Enter your email")
    }
    
    var passwordTextField: some View {
        return CommonSecureField(text: $vm.password, placeholder: "Enter your password")
    }
    
    var forgotPasswordButton: some View {
        Button {
            // TODO: - Handle forgot pass
        } label: {
            Text("Forgot password?")
                .font(AppConfig.font.regular16)
                .foregroundColor(AppConfig.theme.textUnderlineColor)
                .underline()
        }
    }
    
    var registerButton: some View {
        Button {} label: {
            NavigationLink(destination: RegisterView()) {
                Text("Create account")
                    .font(AppConfig.font.regular16)
                    .foregroundColor(AppConfig.theme.textUnderlineColor)
                    .underline()
            }
        }
    }
    
    var loginSocial: some View {
        HStack(spacing: AppConfig.layout.hugeSpace) {
            fbLogin
            ggLogin
            appleLogin
        }
    }
    
    var logoImage: some View {
        return LogoView()
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
    
    var orLoginWithText: some View {
        return Text("Or login with")
            .font(AppConfig.font.regular14)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }
}

#Preview {
    LoginView()
}
