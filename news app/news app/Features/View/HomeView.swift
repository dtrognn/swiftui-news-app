//
//  HomeView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeVM()

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Top headlines", showBackButton: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView(showsIndicators: false) {
                VStack {
                    LazyVStack(spacing: AppConfig.layout.standardSpace) {
                        ForEach(vm.news) { article in
                            ArticleItemView(data: article) { _ in
                                //
                            }
                        }
                    }
                }.padding([.horizontal, .top], AppConfig.layout.standardSpace)
            }
        }.onAppear {
            Task { await vm.getData() }
        }
    }
}

#Preview {
    HomeView()
}
