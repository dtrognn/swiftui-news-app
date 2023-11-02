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
    private let bookmark = BookmarkVM.shared

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Top headlines", showBackButton: false, hiddenTabbar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView(showsIndicators: false) {
                NavigationLink(destination: ArticleDetailView(data: selectedArticle), isActive: $isShowWebview, label: {})
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(Catergory.allCases) { category in
                                CategoryItemView(category: category, isSelected: vm.catergory == category) { category in
                                    vm.catergory = category
                                    Task { await vm.getData() }
                                }
                            }
                        }
                    }
                    LazyVStack(spacing: AppConfig.layout.standardSpace) {
                        ForEach(vm.news) { article in
                            ArticleItemView(data: article, onBookmark: { article in
                                bookmark.addBookmark(article)
                            }) { data in
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
