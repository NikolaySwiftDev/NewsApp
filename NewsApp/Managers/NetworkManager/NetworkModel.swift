//
//  ErrorModel.swift
//  NewsApp
//
//  Created by Николай on 08.05.2025.
//

import Foundation
import Foundation

struct News: Decodable {
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


enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponce = "Invalid Responce"
    case invalidData = "Invalid Data"
}
