import SwiftUI

struct NewsView<ViewModel: NewsViewModelProtocol>: View {
    
    @StateObject var vm: ViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                BackNavigationButton() {
                    vm.popVC()
                }
                
                Spacer()
                
                Text("NEWS")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding(20)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(vm.news, id: \.url) { news in
                        Button {
                            vm.didTapNewsCell(news)
                        } label: {
                            NewsCell(article: news)
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
            vm.fetchNews()
        }
    }
        
}

//#Preview {
//    NewsView(vm: NewsViewModel(networkManager: NetworkManager(), navigator: Router()), model: vm.model)
//}
