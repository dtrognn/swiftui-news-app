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
                HStack(alignment: .center) {
                    avatarView
                    HStack(alignment: .top, spacing: AppConfig.layout.standardSpace) {
                        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                            fullnameText
                            emailInfoText
                        }
                        Spacer()
                    }

                }.frame(maxWidth: .infinity, alignment: .leading)

                VStack(spacing: AppConfig.layout.standardSpace) {
                    Group {
                        VStack(spacing: AppConfig.layout.zero) {
                            userInfoView
                            bookmarkRowView
                        }.cornerRadius(AppConfig.layout.standardCornerRadius)
                    }

                    Group {
                        VStack(spacing: AppConfig.layout.zero) {
                            deleteAccountView
                            logoutView
                        }.cornerRadius(AppConfig.layout.standardCornerRadius)
                    }
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
    var userInfoView: some View {
        return RowCommonView(image: "person", title: "User infomation") {
            // TODO: -
        }
    }

    var bookmarkRowView: some View {
        return RowCommonView(image: "bookmark", title: "Bookmark") {
            // TODO: -
        }
    }

    var logoutView: some View {
        return RowCommonView(image: "rectangle.portrait.and.arrow.forward", title: "Logout", isShowArrow: false) {
            vm.logOut()
        }
    }

    var deleteAccountView: some View {
        return RowCommonView(image: "person.slash", title: "Delete account", isShowArrow: false) {
            vm.deleteUser()
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
