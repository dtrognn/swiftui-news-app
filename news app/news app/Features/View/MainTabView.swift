//
//  MainTabView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            UserInfoView()
                .tabItem {
                    Image(systemName: "person")
                }
        }.accentColor(AppConfig.theme.iconColor)
    }
}

#Preview {
    MainTabView()
}
