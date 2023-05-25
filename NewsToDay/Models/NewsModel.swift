//
//  TopNewsModel.swift
//  NewsAPI
//
//  Created by Vitali Martsinovich on 2023-05-03.
//

import Foundation

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Equatable {
    let title: String?
    let link: String?
    let keywords: [String]?
    let creator: [String]?
    let description, content, pubDate: String?
    let imageURL: String?
    let sourceID: String?
    let category: [String]?
    let country: [String]?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case title, link, keywords, creator
        case description, content, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case category, country, language
    }
}
