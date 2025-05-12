//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Николай on 08.05.2025.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var news: [Article] = []
    @Published var supportNews: [SupprotArticle] = []
    
    private let networkManager = NetworkManager()
    
    //MARK: - Init
    init() {
        fetchTopNews()
        fetchSupprotNews()
    }
    
    //MARK: - Fetch Top News
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
    
    func fetchSupprotNews() {
        Task {
            do {
                let article = try await networkManager.fetchSupportNews()
                supportNews = article.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error.rawValue)
                }
            }
        }
    }
}
