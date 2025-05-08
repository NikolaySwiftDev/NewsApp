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
        VStack {
            ScrollView {
                ForEach(vm.news, id: \.url) { article in
                    Text(article.title)
                        .padding(10)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .padding()

    }
}

#Preview {
    NewsView()
}
