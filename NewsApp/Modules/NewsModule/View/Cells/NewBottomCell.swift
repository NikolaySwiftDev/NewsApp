//
//  NewBottomCell.swift
//  NewsApp
//
//  Created by Николай on 12.05.2025.
//

import SwiftUI

struct NewBottomCell: View {
    let article: BottomArticle
    
    var body : some View {
        VStack {
            if let urlImage = article.urlToImage,
               let imageUrl = URL(string: urlImage) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                        
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 120)
                                .foregroundStyle(.secondary)
                                .cornerRadius(10)
                                .opacity(0.3)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 50)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                Spacer()
                Text(article.publishedAt.convertData())
                    .descrFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

