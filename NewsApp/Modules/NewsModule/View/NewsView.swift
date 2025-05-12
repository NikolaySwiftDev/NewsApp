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
                            NewCell(article: article)
                                .frame(width: 250, height: 250)
                                .padding(10)
                                .background(.white)
                                .cornerRadius(10)
                                .onTapGesture {
                                    print(article.urlToImage as Any)
                                }
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
                            NewBottomCell(article: article)
                                .frame(width: 120, height: 240)
                                .padding(10)
                                .background(.background)
                                .cornerRadius(10)
                                .onTapGesture {
                                    print(article.urlToImage as Any)
                                }
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

