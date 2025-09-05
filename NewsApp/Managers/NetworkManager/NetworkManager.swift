
import Foundation

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
    func fetchNewsByCategory(_ category: NewsCategory) async throws -> NewsResponse
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
    
    
    //MARK: - Fetch News by Category
    func fetchNewsByCategory(_ category: NewsCategory) async throws -> NewsResponse {
        let urlString = "\(baseURL)/top-headlines?country=us&category=\(category.rawValue)&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponce
        }
        
        do {
            return try decoder.decode(NewsResponse.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
        
    }
}
