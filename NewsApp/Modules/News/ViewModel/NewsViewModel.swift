

import Foundation

@MainActor
protocol NewsViewModelProtocol: ObservableObject {

    var news: [Article] { get }
    var isLoading: Bool { get }
    var error: NetworkError? { get }
    var category: NewsCategory { get set }
    
    func fetchNews()
    func didTapNewsCell(_ article: Article)
    func popVC()
}

@MainActor
final class NewsViewModel: NewsViewModelProtocol {


    //MARK: - Properties
    @Published var news: [Article] = []
    @Published var isLoading = false
    @Published var error: NetworkError?
    
    @Published var category: NewsCategory
    
    private let networkManager: NetworkManagerProtocol
    private let navigator: Navigator
    
   
    init(category: NewsCategory, networkManager: NetworkManagerProtocol, navigator: Navigator) {
        self.category = category
        self.networkManager = networkManager
        self.navigator = navigator
    }
    
    //MARK: - Fetch Top News
    func fetchNews() {
        Task {
            do {
                let article = try await networkManager.fetchNewsByCategory(category)
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
    
    func didTapNewsCell(_ article: Article) {
        let model = DetailModel(
            title: article.title,
            descr: article.description,
            author: article.author,
            date: article.publishedAt,
            urlToImage: article.urlToImage
        )
        navigator.push(.newsDetail(model: model))
    }
    
    func popVC() {
        navigator.pop()
    }
    
    
    deinit {
        print("News viewmodel deinit")
    }
}
