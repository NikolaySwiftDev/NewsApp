
import SwiftUI

struct DetailImageView: View {
    //MARK: - Properties
    let model: DetailModel
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            if let urlImage = model.urlToImage,
               let imageUrl = URL(string: urlImage) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: SizeConstant.width + 10, height: geometry.frame(in: .global).minY + SizeConstant.heigh)
                    }
                }
            }
        }
        .frame(height: SizeConstant.heigh)
    }
}


