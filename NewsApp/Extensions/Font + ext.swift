//
//  Font + ext.swift
//  NewsApp
//
//  Created by Николай on 09.05.2025.
//

import Foundation
import SwiftUICore


extension Text {
    
    func titleFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 16,
                          weight: .bold,
                          design: .rounded))
            .opacity(0.8)
    }
    
    func descrFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 14,
                          weight: .regular,
                          design: .rounded))
            .opacity(0.8)
    }
    
}
