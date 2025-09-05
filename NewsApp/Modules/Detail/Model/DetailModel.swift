
import Foundation
import UIKit

struct DetailModel: Hashable {
    let title: String
    let descr: String?
    let author: String?
    let date: Date
    let image: UIImage? // Заменяем urlToImage на готовое изображение
}
