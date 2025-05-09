//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Николай on 08.05.2025.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    
    @Published var news: [Article] = []
    private let networkManager = NetworkManager()
    
    init() {
        fetchNews()
    }
    
    private func fetchNews() {
        Task {
            do {
                let article = try await networkManager.fetchNews()
                news = article.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error.rawValue)
                }
            }
        }
    }
    
    private func fetchImages() {
        
    }
}
