

import Foundation
import SwiftUI

struct BackNavigationButton: View {
    
    //MARK: - Properties
    @State var dismiss: () -> () = { }

    
    //MARK: - Body
    var body : some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 35)
                    .foregroundStyle(.black)
                    .opacity(0.3)
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .opacity(0.7)
                
            }
        }
    }
}

//MARK: - Preview
#Preview {
    BackNavigationButton()
}
