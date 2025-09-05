
import Foundation

//MARK: - Network Error
enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponce = "Invalid Responce"
    case invalidData = "Invalid Data"
    case imageLoadingFailed = "Image Loading Failed"
}
