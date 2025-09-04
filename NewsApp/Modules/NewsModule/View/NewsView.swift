import SwiftUI

struct NewsView<ViewModel: NewsViewModelProtocol>: View {
    
    @StateObject var vm: ViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("TOP NEWS")
                .font(.title)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top], 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(vm.news, id: \.url) { news in
                        Button {
                            vm.didTapArticle(news)
                        } label: {
                            NewCell(article: news)
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
                        Button {
                            vm.didTapSupprotArticle(article)
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
        .onAppear {
            vm.fetchSupprotNews()
            vm.fetchTopNews()
        }
    }
        
}

#Preview {
    NewsView(vm: NewsViewModel(networkManager: NetworkManager(), navigator: Router()))
}
