
import Foundation

extension String {
    func toDate() -> Date? {
        let formaater = DateFormatter()
        formaater.dateFormat = "yyyy-MM-dd"
        let stringDate = formaater.date(from: self)
        return stringDate
    }
}
