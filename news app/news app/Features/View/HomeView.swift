//
//  HomeView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeVM()
    @State private var selectedArticle: ArticleItemViewData? = nil
    @State private var isShowWebview: Bool = false

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Top headlines", showBackButton: false, hiddenTabbar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView(showsIndicators: false) {
                NavigationLink(destination: ArticleDetailView(data: selectedArticle), isActive: $isShowWebview, label: {})
                VStack {
                    LazyVStack(spacing: AppConfig.layout.standardSpace) {
                        ForEach(vm.news) { article in
                            ArticleItemView(data: article) { data in
                                selectedArticle = data
                                isShowWebview = true
                            }
                        }
                    }
                }.padding(.horizontal, AppConfig.layout.standardSpace)
            }.padding(.top, AppConfig.layout.standardSpace)
        }.onAppear {
            Task { await vm.getData() }
        }.refreshable {
            Task { await vm.getData() }
        }
    }
}

#Preview {
    HomeView()
}
