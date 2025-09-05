

import SwiftUI

struct MenuView: View {
    
    let model = NewsCategory.allCases
    let navigator: Navigator
    
    var body: some View {
        VStack {
            ForEach(model, id: \.hashValue) { category in
                    Button {
                        navigator.push(.news(category: category))
                    } label: {
                        Text(category.displayName)
                            .font(.title2)
                            .padding(15)
                    }
                    .buttonStyle(.plain)
            }
        }
    }
}

//#Preview {
//    MenuView(navigator: Router())
//}
