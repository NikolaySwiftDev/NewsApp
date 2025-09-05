
import SwiftUI
import SDWebImageSwiftUI

struct DetailImageView: View {
    //MARK: - Properties
    let model: DetailModel
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            if let urlImage = model.image {
                Image(uiImage: urlImage)
                            .resizable()
                            .frame(width: SizeConstant.width, height: SizeConstant.heigh)
            }
        }
        .frame(height: SizeConstant.heigh)
    }
}


