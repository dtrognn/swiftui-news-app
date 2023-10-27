//
//  ImageURL.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import SwiftUI

struct ImageURL: View {
    var url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            switch image {
            case .empty:
                emptyView
                    .frame(minHeight: 150, maxHeight: 200)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minHeight: 150, maxHeight: 200)
                    .cornerRadius(AppConfig.layout.standardCornerRadius)
            case .failure:
                failureView
                    .frame(minHeight: 150, maxHeight: 200)
            @unknown default:
                fatalError()
            }
        }
    }
}

private extension ImageURL {
    var emptyView: some View {
        return HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }

    var failureView: some View {
        return HStack {
            Spacer()
            imageFailure
            Spacer()
        }
    }
    
    var imageFailure: some View {
        return Image(systemName: "photo")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    ImageURL(url: "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/rockcms/2023-10/231024-yocheved-lifshitz-press-conference-jm-0647-693270.jpg")
}
