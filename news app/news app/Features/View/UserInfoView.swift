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
        return ScreenConfiguration(title: "", showNaviBar: false, hiddenTabbar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            VStack(spacing: AppConfig.layout.hugeSpace) {
                HStack(alignment: .top) {
                    avatarView
                    HStack(alignment: .top, spacing: AppConfig.layout.standardSpace) {
                        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                            fullnameText
                            emailInfoText
                        }
                        Spacer()
                        editButton
                    }

                }.frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: AppConfig.layout.standardSpace) {
                    deleteAccountButton
                    logoutButton
                }
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

    var deleteAccountButton: some View {
        return CommonButton(text: "Delete account", isEnable: .constant(true)) {
            vm.deleteUser()
        }
    }

    var editButton: some View {
        return Button {
            // TODO: - Handle edit profile
        } label: {
            Image(systemName: "square.and.pencil.circle")
                .resizable()
                .applyTheme()
                .frame(width: 20, height: 20)
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

    var avatarView: some View {
        return Circle()
            .frame(width: 75, height: 75).foregroundColor(AppConfig.theme.lineColor)
            .overlay(
                avatarImage
            )
    }

    var avatarImage: some View {
        return Image(systemName: "person")
            .resizable()
            .applyTheme()
            .frame(width: 40, height: 40)
    }
}

#Preview {
    UserInfoView()
}
