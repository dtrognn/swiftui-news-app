//
//  HomeView.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import SwiftUI

struct HomeView: View {
    var screenConfiguration: ScreenConfiguration {
        return ScreenConfiguration(title: "Top headlines", showBackButton: false)
    }
    
    var body: some View {
        ScreenContainerView(screenConfiguration: screenConfiguration) {
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    HomeView()
}
