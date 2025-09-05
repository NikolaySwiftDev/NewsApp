
import Foundation
import UIKit

enum NewsCategory: String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    var displayName: String {
        switch self {
        case .business: return "Бизнес"
        case .entertainment: return "Развлечения"
        case .general: return "Общее"
        case .health: return "Здоровье"
        case .science: return "Наука"
        case .sports: return "Спорт"
        case .technology: return "Технологии"
        }
    }
}

protocol NetworkManagerProtocol: AnyObject {
    func fetchNewsByCategory(_ category: NewsCategory) async throws -> [Article]
    func loadImage(for article: Article) async throws -> UIImage?
}

final class NetworkManager: NetworkManagerProtocol {


    //MARK: - Properties
    private let apiKey = "b123af3bd3ce43f8b3a168dd82e32a6a"
    private let baseURL = "https://newsapi.org/v2"
    private let decoder = JSONDecoder()
    
    //MARK: - News Categories
    
    
    //MARK: - Init
    init() {
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    
    //MARK: - Fetch News by Category with Images
       func fetchNewsByCategory(_ category: NewsCategory) async throws -> [Article] {
           let urlString = "\(baseURL)/top-headlines?country=us&category=\(category.rawValue)&apiKey=\(apiKey)"
           
           guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
           let (data, response) = try await URLSession.shared.data(from: url)
           guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
               throw NetworkError.invalidResponce
           }
           
           do {
               let newsResponse = try decoder.decode(NewsResponse.self, from: data)
               // Загружаем изображения для всех статей
               return await withTaskGroup(of: (Int, UIImage?).self) { group in
                   var articles = newsResponse.articles
                   
                   // Запускаем параллельную загрузку изображений
                   for (index, article) in articles.enumerated() {
                       group.addTask {
                           do {
                               let image = try await self.loadImage(for: article)
                               return (index, image)
                           } catch {
                               return (index, nil)
                           }
                       }
                   }
                   
                   // Собираем результаты
                   for await (index, image) in group {
                       articles[index].image = image
                   }
                   
                   return articles
               }
           } catch {
               throw NetworkError.invalidData
           }
       }
       
       //MARK: - Load Image for Article
       func loadImage(for article: Article) async throws -> UIImage? {
           guard let imageUrlString = article.urlToImage,
                 let imageUrl = URL(string: imageUrlString) else {
               return nil
           }
           
           let (data, response) = try await URLSession.shared.data(from: imageUrl)
           guard let httpResponse = response as? HTTPURLResponse,
                 httpResponse.statusCode == 200,
                 let image = UIImage(data: data) else {
               return nil
           }
           
           return image
       }
}
