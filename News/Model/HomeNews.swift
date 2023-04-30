//
//  HomeNews.swift
//  News
//
//  Created by Mohamed Hadwa on 30/04/2023.
//

import Foundation

struct HomeNews: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title, description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    var id: ID?
    var name: String?
}

enum ID: String, Codable {
    case businessInsider = "business-insider"
    case engadget = "engadget"
    case googleNews = "google-news"
    case wired = "wired"
}
