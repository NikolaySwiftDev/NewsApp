
import SwiftUI
import SDWebImageSwiftUI

struct NewCell: View {
    //MARK: - Properties
    let article: Article
    
    //MARK: - Body
    var body : some View {
        VStack {
            if let urlImage = article.urlToImage,
               let imageUrl = URL(string: urlImage) {
                WebImage(url: imageUrl)
                            .resizable()
//                            .scaledToFill()
                            .frame(height: 150)
                            .cornerRadius(10)
                            .padding(.horizontal, 5)
                        
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .foregroundStyle(.secondary)
                                .cornerRadius(10)
                                .opacity(0.3)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 80)
                            
//                        }
//                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                Spacer()
                Text(article.publishedAt.convertData())
                    .descrFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 250, height: 250)
        .padding(10)
        .background(.white)
        .cornerRadius(10)
    }
}

