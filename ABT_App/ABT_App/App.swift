import SwiftUI

@main
struct ABT_App: App {
    @StateObject private var orderManager = OrderManager() // Создаём объект OrderManager

    var body: some Scene {
        WindowGroup {
            MainTabView() // Ваше корневое представление
                .environmentObject(orderManager) // Передаём OrderManager в окружение
        }
    }
}
