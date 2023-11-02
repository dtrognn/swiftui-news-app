//
//  ArticleItemViewData.swift
//  news app
//
//  Created by dtrognn on 26/10/2023.
//

import Foundation

class ArticleItemViewData: Identifiable, ObservableObject, Codable {
    var id: String = UUID().uuidString
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

    enum CodingKeys: String, CodingKey {
        case id
        case source
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case isBookMark
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(source, forKey: .source)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(url, forKey: .url)
        try container.encode(urlToImage, forKey: .urlToImage)
        try container.encode(publishedAt, forKey: .publishedAt)
        try container.encode(isBookMark, forKey: .isBookMark)
    }

    required init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        source = try container.decode(String.self, forKey: .source)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        url = try container.decode(String.self, forKey: .url)
        urlToImage = try container.decode(String.self, forKey: .urlToImage)
        publishedAt = try container.decode(String.self, forKey: .publishedAt)
        isBookMark = try container.decode(Bool.self, forKey: .isBookMark)
    }
}
