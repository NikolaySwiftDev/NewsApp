
import SwiftUI
import SDWebImageSwiftUI

struct NewsCell: View {
    //MARK: - Properties
    let article: Article
    
    //MARK: - Body
    var body : some View {
        VStack {
            if let urlImage = article.urlToImage,
               let imageUrl = URL(string: urlImage) {
                
                //Use Cache
                WebImage(url: imageUrl)
                    .resizable()
                    .frame(height: 150)
                    .cornerRadius(10)
                    .padding(.horizontal, 5)
                
                //Without cache
//                NonCachedWebImage(url: imageUrl)
                
            } else {
                ZStack {
                    Rectangle()
                        .frame(height: 110)
                        .foregroundStyle(.secondary)
                        .cornerRadius(10)
                        .opacity(0.3)
                    
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundStyle(.secondary)
                        .scaledToFit()
                        .frame(height: 80)
                }
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                Spacer()
                Text(article.publishedAt)
                    .descrFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 220, height: 250)
        .padding(10)
        .background(.white)
        .cornerRadius(10)
    }
}

struct NonCachedWebImage: View {
    let url: URL?
    @State private var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 160)
                    .cornerRadius(10)
                    .padding(.horizontal, 5)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 160)
                    .cornerRadius(10)
                    .padding(.horizontal, 5)
            }
        }
        .onAppear(perform: loadImage)
    }
    
    private func loadImage() {
        guard let url = url else { return }
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}

