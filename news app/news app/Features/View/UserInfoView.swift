//
//  UserInfoView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct UserInfoView: View {
    @EnvironmentObject private var appSceneRouter: AppSceneRouter
    @StateObject private var vm = UserInfoVM()

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "", showNaviBar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            VStack(spacing: AppConfig.layout.hugeSpace) {
                VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                    fullnameText
                    emailInfoText
                }
                logoutButton
            }.padding(.horizontal, AppConfig.layout.standardSpace)
                .padding(.top, AppConfig.layout.hugeSpace * 3)
        }.onAppear {
            vm.fetchData()
        }.onReceive(vm.onNextScreen, perform: { _ in
            appSceneRouter.rootView = .login
        })
    }
}

private extension UserInfoView {
    var logoutButton: some View {
        return CommonButton(text: "Logout", isEnable: .constant(true)) {
            vm.logOut()
        }
    }
    
    var fullnameText: some View {
        return Text(vm.user?.fullname ?? "Unknow")
            .font(AppConfig.font.semibold16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }
    
    var emailInfoText: some View {
        return Text(vm.user?.email ?? "example@gmail.com")
            .font(AppConfig.font.regular14)
            .foregroundColor(AppConfig.theme.textNoteColor)
    }
}

#Preview {
    UserInfoView()
}
