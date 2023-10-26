//
//  ArticleItemViewData.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

struct ArticleItemViewData: Identifiable {
    let id: String = UUID().uuidString
    let source: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}
