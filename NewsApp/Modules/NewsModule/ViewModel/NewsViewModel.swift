

import Foundation

@MainActor
protocol NewsViewModelProtocol: ObservableObject {
    var news: [Article] { get }
    var supportNews: [SupprotArticle] { get }
    var isLoading: Bool { get }
    var error: NetworkError? { get }
    
    func fetchTopNews()
    func fetchSupprotNews()
    func didTapArticle(_ article: Article)
    func didTapSupprotArticle(_ article: SupprotArticle)
}

@MainActor
final class NewsViewModel: NewsViewModelProtocol {

    //MARK: - Properties
    @Published var news: [Article] = []
    @Published var supportNews: [SupprotArticle] = []
    @Published var isLoading = false
    @Published var error: NetworkError?
    
    private let networkManager: NetworkManagerProtocol
    private let navigator: Navigator
    
    init(networkManager: NetworkManagerProtocol, navigator: Navigator) {
        self.networkManager = networkManager
        self.navigator = navigator
    }
    
    //MARK: - Fetch Top News
    func fetchTopNews() {
        Task {
            do {
                let article = try await networkManager.fetchTopNews()
                news = article.articles
            } catch {
                if let error = error as? NetworkError {
                    self.error = error
                    print(error.rawValue)
                }
                
            }
        }
        isLoading = true
    }
    
    func fetchSupprotNews() {
        isLoading = false
        Task {
            do {
                let article = try await networkManager.fetchSupportNews()
                supportNews = article.articles
            } catch {
                if let error = error as? NetworkError {
                    self.error = error
                    print(error.rawValue)
                }
            }
        }
    }
    
    func didTapArticle(_ article: Article) {
        let model = DetailModel(
            title: article.title,
            descr: article.articleDescription,
            author: article.author,
            date: article.publishedAt,
            urlToImage: article.urlToImage
        )
        navigator.push(.itemDetail(model: model))
    }

    func didTapSupprotArticle(_ article: SupprotArticle) {
        let model = DetailModel(
            title: article.title,
            descr: article.description,
            author: article.author,
            date: article.publishedAt,
            urlToImage: article.urlToImage
        )
        navigator.push(.itemDetail(model: model))
    }
}
