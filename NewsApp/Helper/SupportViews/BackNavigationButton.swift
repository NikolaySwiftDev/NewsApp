//
//  BackNavigationButton.swift
//  NewsApp
//
//  Created by Николай on 12.05.2025.
//

import Foundation
import SwiftUI

struct BackNavigationButton: View {
    @Environment(\.dismiss) var dismiss
    
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

#Preview {
    BackNavigationButton()
}
