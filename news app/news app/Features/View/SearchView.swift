//
//  SearchView.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var vm = SearchVM()

    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Search article", showBackButton: false, hiddenTabbar: false, showUnderline: true)
    }

    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            VStack {
                SearchBarView(text: $vm.text)
            }.padding(.top, AppConfig.layout.standardSpace)
        }
    }
}

#Preview {
    SearchView()
}
