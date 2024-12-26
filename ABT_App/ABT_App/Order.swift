import Foundation

struct Order: Identifiable {
    let id: UUID
    let date: Date
    var status: String // "в пути" или "завершен"
    let destination: String
    let approximateArrival: String
}
