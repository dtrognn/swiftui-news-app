//
//  BookmarkView.swift
//  news app
//
//  Created by dtrognn on 02/11/2023.
//

import SwiftUI

struct BookmarkView: View {
    @StateObject private var vm = BookmarkVM.shared
    @State private var selectedArticle: ArticleItemViewData? = nil
    @State private var isShowWebview: Bool = false

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Bookmark", showNaviBar: true, showUnderline: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView(showsIndicators: false) {
                NavigationLink(destination: ArticleDetailView(data: selectedArticle), isActive: $isShowWebview, label: {})
                
                LazyVStack(spacing: AppConfig.layout.standardSpace) {
                    ForEach(vm.bookmarks) { article in
                        BookmarkItemView(data: article, onDelete: { data in
                            vm.removeBoolmark(data)
                        }) { articleSelected in
                            selectedArticle = articleSelected
                            isShowWebview = true
                        }
                    }
                }.padding([.horizontal, .top], AppConfig.layout.standardSpace)
            }
        }
    }
}

#Preview {
    BookmarkView()
}
