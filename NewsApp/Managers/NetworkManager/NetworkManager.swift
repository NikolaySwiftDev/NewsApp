
import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func fetchTopNews() async throws -> TopNews
    func fetchSupportNews() async throws -> SupportNews
}

final class NetworkManager: NetworkManagerProtocol {
        
    //MARK: - Properties
    private let apiKey = "b123af3bd3ce43f8b3a168dd82e32a6a"
    private let urlTopNews = "https://newsapi.org/v2/everything?q=tesla&from=2025-09-02&sortBy=publishedAt&apiKey=b123af3bd3ce43f8b3a168dd82e32a6a"
    private let urlSupportNews = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b123af3bd3ce43f8b3a168dd82e32a6a"
    private let decoder = JSONDecoder()
    
    //MARK: - Init
    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //MARK: - Fetch Top News
    func fetchTopNews() async throws -> TopNews {
        
        guard let url = URL(string: urlTopNews) else { throw NetworkError.invalidURL }
        let (data, responce) = try await URLSession.shared.data(from: url)
        guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else { throw NetworkError.invalidResponce }
        do {
            return try decoder.decode(TopNews.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    //MARK: - Fetch Support News
    func fetchSupportNews() async throws -> SupportNews {
        
        guard let url = URL(string: urlSupportNews) else { throw NetworkError.invalidURL }
        let (data, responce) = try await URLSession.shared.data(from: url)
        guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else { throw NetworkError.invalidResponce }
        do {
            return try decoder.decode(SupportNews.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    deinit {
        print("Deinit Network")
    }
}
