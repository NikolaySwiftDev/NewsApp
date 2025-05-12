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
                            NavigationLink {
                                let model = DetailModel(title: article.title,
                                                        descr: article.articleDescription,
                                                        author: article.author,
                                                        date: article.publishedAt,
                                                        urlToImage: article.urlToImage)
                                DetailView(model: model)
                            } label: {
                                NewCell(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    
                }
                .padding(10)
                .shadow(radius: 10)
                Text("BOTTOM NEWS")
                    .font(.title)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top],20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(vm.bottomNews, id: \.url) { article in
                            NavigationLink {
                                let model = DetailModel(title: article.title,
                                                        descr: article.description,
                                                        author: article.author,
                                                        date: article.publishedAt,
                                                        urlToImage: article.urlToImage)

                                DetailView(model: model)
                            } label: {
                                NewBottomCell(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(10)
                .shadow(radius: 10)
            }
            .background(.secondary.opacity(0.2))
            .refreshable {
                vm.fetchTopNews()
                vm.fetchBottomNews()
            }
        }
    }
}

#Preview {
    NewsView()
}

