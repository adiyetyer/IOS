import SwiftUI

class OrderManager: ObservableObject {
    @Published var orders: [Order] = [] // Все заказы
    @Published var activeOrder: Order? = nil // Активный заказ

    init() {
        // Добавляем тестовые данные
        orders = [
            Order(
                id: UUID(),
                date: Date().addingTimeInterval(-86400),
                status: "в пути",
                destination: "Astana",
                approximateArrival: "2024-12-26"
            ),
            Order(
                id: UUID(),
                date: Date().addingTimeInterval(-172800),
                status: "завершен",
                destination: "Shymkent",
                approximateArrival: "2024-12-25"
            )
        ]
    }
}


