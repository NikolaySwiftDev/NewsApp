

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
