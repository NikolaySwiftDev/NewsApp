//
//  DetailImageView.swift
//  NewsApp
//
//  Created by Николай on 12.05.2025.
//

import SwiftUI

struct DetailImageView: View {
    let model: DetailModel
    
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

struct GradientDetailImageView: View {
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
