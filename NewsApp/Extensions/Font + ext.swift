
import Foundation
import SwiftUICore

extension Text {
    
    func titleFont(size: CGFloat = 16) -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: size,
                          weight: .bold,
                          design: .rounded))
            .opacity(0.8)
    }
    
    func descrFont(size: CGFloat = 14) -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: size,
                          weight: .regular,
                          design: .rounded))
            .opacity(0.8)
    }
    
}
