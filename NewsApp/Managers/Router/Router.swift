import Foundation
import SwiftUI


enum AppRoute: Hashable {
    case items
    case itemDetail(model: DetailModel)
}

enum SheetRoute: Hashable {
    case settings
}

protocol Navigator {
    func push(_ route: AppRoute)
    func pop()
    func popToRoot()
    func present(_ sheet: SheetRoute)
    func dismissSheet()
}

final class Router: ObservableObject, Navigator {
    @Published var path = NavigationPath()
    @Published var activeSheet: SheetRoute?

    func push(_ route: AppRoute) { path.append(route) }
    func pop() { if !path.isEmpty { path.removeLast() } }
    func popToRoot() { path = NavigationPath() }
    func present(_ sheet: SheetRoute) { activeSheet = sheet }
    func dismissSheet() { activeSheet = nil }
}

private struct SheetIdent: Identifiable {
    let id = UUID()
    let value: SheetRoute
}

struct RoutingView: View {
    @StateObject private var router = Router()
    
    private let networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            NewsView(vm: NewsViewModel(networkManager: networkManager, navigator: router))
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .items:
                        Text("Items list")
                    case .itemDetail(let model):
                        DetailView(vm: DetailViewModel(navigator: router, model: model))
                    }
                }
        }
    }
}

