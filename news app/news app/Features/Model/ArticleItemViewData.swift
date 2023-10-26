//
//  ArticleItemViewData.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

class ArticleItemViewData: Identifiable, ObservableObject {
    let id: String = UUID().uuidString
    let source: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    
    @Published var isBookMark: Bool = false
    
    init(source: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String) {
        self.source = source
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}
