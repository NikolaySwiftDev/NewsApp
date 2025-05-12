//
//  NewCell.swift
//  NewsApp
//
//  Created by Николай on 12.05.2025.
//
import SwiftUI

struct NewCell: View {
    let article: Article
    
    var body : some View {
        VStack {
            if let urlImage = article.urlToImage,
               let imageUrl = URL(string: urlImage) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .cornerRadius(10)
                        
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .foregroundStyle(.secondary)
                                .cornerRadius(10)
                                .opacity(0.3)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 80)
                            
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
        .frame(width: 250, height: 250)
        .padding(10)
        .background(.white)
        .cornerRadius(10)
    }
}

