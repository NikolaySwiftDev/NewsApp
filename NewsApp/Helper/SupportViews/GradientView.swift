
import SwiftUI

struct GradientDetailImageView: View {
    
    //MARK: - Body
    var body: some View {
        GeometryReader { _ in
            LinearGradient(colors: [Color(UIColor.systemBackground), .clear],
                           startPoint: .bottom,
                           endPoint: .top)
            .frame(height: SizeConstant.heigh / 4)
            .offset(y: -SizeConstant.heigh / 4)
        }
    }
}
