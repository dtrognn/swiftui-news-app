//
//  SearchView.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var webviewVM = WebViewVM()

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Search article", hiddenTabbar: false)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ZStack {
                WebViewCommon(webviewVM)
                    .onAppear {
                        webviewVM.loadData("https://www.thedailybeast.com/dems-turn-mike-johnsons-first-viral-moment-into-anti-gop-ad")
                    }
            }
        }
    }
}

#Preview {
    SearchView()
}
