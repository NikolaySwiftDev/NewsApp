
import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    @StateObject var vm: DetailViewModel
    
    //MARK: - Body
    var body : some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                
                DetailImageView(model: vm.model)
                VStack(alignment: .leading, spacing: 20) {
                    Text(vm.model.title)
                        .titleFont(size: 20)
                    Text(vm.model.descr ?? "")
                        .descrFont()
                    HStack {
                        Text(vm.model.author ?? "")
                            .descrFont()
                        Spacer()
                        Text(vm.model.date)
                            .descrFont()
                    }
                }
                .padding(.top,0)
                .padding(20)
                .background(.background)
                .background(GradientDetailImageView())
                
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            
            BackNavigationButton() {
                vm.popVC()
            }
                .padding(.leading, 10)
        }
    }
}

//MARK: - Preview
#Preview {
    DetailView(vm: DetailViewModel(navigator: Router(), model: DetailModel(title: "Mock",
                                                                           descr: "Mock",
                                                                           author: "Mock",
                                                                           date: "Date()",
                                                                           urlToImage: "https://picsum.dev/300/200")))
}


