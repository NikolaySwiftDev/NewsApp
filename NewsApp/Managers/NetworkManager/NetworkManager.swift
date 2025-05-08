//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Николай on 08.05.2025.
//

import Foundation


final class NetworkManager {
        
    private let apiKey = "b123af3bd3ce43f8b3a168dd82e32a6a"
    private let url = "https://newsapi.org/v2/everything?q=tesla&from=2025-04-08&sortBy=publishedAt&apiKey=b123af3bd3ce43f8b3a168dd82e32a6a"
    private let decoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func fetchNews() async throws -> News {
        
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        let (data, responce) = try await URLSession.shared.data(from: url)
        guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else { throw NetworkError.invalidResponce }
        do {
            return try decoder.decode(News.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
