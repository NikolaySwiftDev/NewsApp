//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Николай on 04.09.2025.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    private let navigator: Navigator
    @Published var model: DetailModel
    
    init(navigator: Navigator, model: DetailModel) {
        self.navigator = navigator
        self.model = model
    }

    func popVC() {
        navigator.pop()
    }
    
    deinit {
        print("Deinit")
    }
    
}
