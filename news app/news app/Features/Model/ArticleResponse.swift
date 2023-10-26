//
//  ArticleResponse.swift
//  news app
//
//  Created by dtrognn on 25/10/2023.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    init(source: Source?, author: String?, title: String?, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    var timeFormatted: String {
        return convertDateFormat(publishedAt ?? "") ?? ""
    }
    
    func convertDateFormat(_ inputDate: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = DateFormatType.server.rawValue
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = DateFormatType.dayMonthYear.rawValue

        if let date = inputFormatter.date(from: inputDate) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }

    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

struct Source: Codable {
    let id: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
