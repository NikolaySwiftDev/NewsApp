
import SwiftUI
import SDWebImageSwiftUI

struct DetailImageView: View {
    //MARK: - Properties
    let model: DetailModel
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            if let urlImage = model.urlToImage,
               let imageUrl = URL(string: urlImage) {
                WebImage(url: imageUrl)
                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: SizeConstant.width, height: SizeConstant.heigh)
//                    }
//                }
            }
        }
        .frame(height: SizeConstant.heigh)
    }
}


