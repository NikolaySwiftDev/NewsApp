
import SwiftUI

struct NewsView: View {
    
    //MARK: - Propertise
    @StateObject var vm = NewsViewModel()
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("TOP NEWS")
                    .font(.title)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top],20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(vm.news, id: \.url) { article in
                            NavigationLink {
                                let model = DetailModel(title: article.title,
                                                        descr: article.articleDescription,
                                                        author: article.author,
                                                        date: article.publishedAt,
                                                        urlToImage: article.urlToImage)
                                DetailView(model: model)
                            } label: {
                                NewCell(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    
                }
                .padding(10)
                .shadow(radius: 10)
                Text("SUPPORT NEWS")
                    .font(.title)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top],20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(vm.supportNews, id: \.url) { article in
                            NavigationLink {
                                let model = DetailModel(title: article.title,
                                                        descr: article.description,
                                                        author: article.author,
                                                        date: article.publishedAt,
                                                        urlToImage: article.urlToImage)

                                DetailView(model: model)
                            } label: {
                                NewSupportCell(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(10)
                .shadow(radius: 10)
            }
            .background(.secondary.opacity(0.2))
            .refreshable {
                vm.fetchTopNews()
                vm.fetchSupprotNews()
            }
        }
    }
}

//MARK: - Preview
#Preview {
    NewsView()
}

