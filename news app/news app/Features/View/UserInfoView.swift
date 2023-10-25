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
            VStack {
                logoutButton
            }.padding(.horizontal, AppConfig.layout.standardSpace)
                .padding(.top, AppConfig.layout.hugeSpace * 3)
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
}

#Preview {
    UserInfoView()
}
