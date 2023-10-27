//
//  ArticleDetailView.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI

struct ArticleDetailView: View {
    @StateObject private var vm = WebViewVM()
    var data: ArticleItemViewData?

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Article", showNaviBar: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ZStack {
                VStack(spacing: AppConfig.layout.zero) {
                    if vm.showLoading {
                        ProgressView()
                            .padding(.vertical, AppConfig.layout.standardSpace)
                            .frame(maxWidth: .infinity)
                    }
                    WebViewCommon(vm)
                }
            }.onAppear {
                vm.loadData(data?.url ?? "")
            }
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ArticleDetailView(data: ArticleItemViewData(source: "", title: "", description: "", url: "", urlToImage: "", publishedAt: ""))
}
