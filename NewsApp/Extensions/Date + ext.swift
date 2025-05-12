
import Foundation

extension Date {
    func convertData() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}
