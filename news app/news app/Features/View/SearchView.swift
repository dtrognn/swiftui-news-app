//
//  SearchView.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var vm = SearchVM()
    @State private var selectedArticle: ArticleItemViewData? = nil
    @State private var isShowWebview: Bool = false

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Search article", showBackButton: false, hiddenTabbar: false, showUnderline: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            VStack(spacing: AppConfig.layout.standardSpace) {
                NavigationLink(destination: ArticleDetailView(data: selectedArticle), isActive: $isShowWebview) {}
                SearchBarView(text: $vm.text)

                VStack {
                    if vm.isLoading {
                        ProgressView().applyTheme()
                            .padding(.vertical, AppConfig.layout.standardSpace)
                            .frame(maxWidth: .infinity)
                    }

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: AppConfig.layout.standardSpace) {
                            ForEach(vm.news) { article in
                                ArticleItemView(data: article) { data in
                                    selectedArticle = data
                                    isShowWebview = true
                                }
                            }
                        }
                    }.onChange(of: vm.text) { _ in
                        loadData(showLoading: true)
                    }.refreshable {
                        loadData(showLoading: false)
                    }
                }.padding(.horizontal, AppConfig.layout.standardSpace)
            }
        }
    }

    private func loadData(showLoading: Bool) {
        DispatchQueue.main.async {
            vm.getData(showLoading: showLoading)
        }
    }
}

#Preview {
    SearchView()
}
