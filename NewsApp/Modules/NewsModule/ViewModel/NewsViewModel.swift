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
    @Published var bottomNews: [BottomArticle] = []
    
    private let networkManager = NetworkManager()
    
    init() {
        fetchTopNews()
        fetchBottomNews()
    }
    
    func fetchTopNews() {
        Task {
            do {
                let article = try await networkManager.fetchTopNews()
                news = article.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error.rawValue)
                }
            }
        }
    }
    
    func fetchBottomNews() {
        Task {
            do {
                let article = try await networkManager.fetchTBottomNews()
                bottomNews = article.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error.rawValue)
                }
            }
        }
    }
}
