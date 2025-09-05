import Foundation
import UIKit

// Модели данных
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
    var image: UIImage? = nil
    
    var cacheCost: Int {
        var cost = title.utf8.count + (description?.utf8.count ?? 0)
        if let imageData = image?.pngData() {
            cost += imageData.count
        }
        return cost
    }
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}


struct Source: Codable {
    let id: String?
    let name: String
}
