
import Foundation

//MARK: - Top News
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

//MARK: - Sipport News
struct SupportNews: Decodable {
    let status: String
    let totalResults: Int
    let articles: [SupprotArticle]
}

struct SupprotArticle: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}
