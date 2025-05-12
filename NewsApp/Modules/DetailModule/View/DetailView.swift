//
//  DatailView.swift
//  NewsApp
//
//  Created by Николай on 12.05.2025.
//

import Foundation

import SwiftUI

struct DetailView: View {
    let model: DetailModel
    var body : some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                
                DetailImageView(model: model)
                VStack(alignment: .leading, spacing: 20) {
                    Text(model.title)
                        .titleFont(size: 20)
                    Text(model.descr ?? "")
                        .descrFont()
                    HStack {
                        Text(model.author ?? "")
                            .descrFont()
                        Spacer()
                        Text(model.date.convertData())
                            .descrFont()
                    }
                }
                .padding(.top,0)
                .padding(20)
                .background(.background)
                .background(GradientDetailImageView())
                
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            
            BackNavigationButton()
                .padding(.leading, 10)
        }
    }
}

#Preview {
    DetailView(model: DetailModel(title: "Mock",
                                  descr: "Mock",
                                  author: "Mock",
                                  date: Date(),
                                  urlToImage: "https://picsum.dev/300/200"))
}


