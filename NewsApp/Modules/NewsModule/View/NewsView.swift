//
//  ContentView.swift
//  NewsApp
//
//  Created by Николай on 08.05.2025.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var vm = NewsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("TOP NEWS")
                    .font(.title)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top],20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(vm.news, id: \.url) { article in
                            VStack {
                                if let urlImage = article.urlToImage,
                                   let imageUrl = URL(string: urlImage) {
                                    AsyncImage(url: imageUrl) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 150)
                                                .cornerRadius(10)
                                            
                                        } else {
                                            ZStack {
                                                Rectangle()
                                                    .frame(height: 150)
                                                    .opacity(0.3)
                                                    .background(.secondary)
                                                    .cornerRadius(10)
                                                
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .foregroundStyle(.secondary)
                                                    .opacity(0.3)
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
                            .frame(width: 250, height: 250)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(10)
                        }
                      
                        
                    }
                  
                }
            }
            .background(.secondary.opacity(0.2))
        }
    }
}

#Preview {
    NewsView()
}

