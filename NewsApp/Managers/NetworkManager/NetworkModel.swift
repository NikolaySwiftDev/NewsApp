//
//  ErrorModel.swift
//  NewsApp
//
//  Created by Николай on 08.05.2025.
//

import Foundation

struct TopNews: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}

struct BottomNews: Decodable {
    let status: String
    let totalResults: Int
    let articles: [BottomArticle]
}

struct BottomArticle: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponce = "Invalid Responce"
    case invalidData = "Invalid Data"
}

