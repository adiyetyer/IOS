import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = 0 // Текущая выбранная вкладка
    @State private var navigationPath = NavigationPath() // Управление навигацией для вкладки Home

    var body: some View {
        TabView(selection: $selectedTab) {
            // Вкладка Home
            NavigationStack(path: $navigationPath) {
                HomePageHeader()
                    .navigationDestination(for: String.self) { destination in
                        if destination == "SendCargo" {
                            SendCargoStep1View()
                        }
                        // Можно добавить другие страницы по мере необходимости
                    }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0) // Вкладка Home

            // Вкладка Calculator
            PriceCalculatorView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Calculator")
                }
                .tag(1)

            // Вкладка Profile
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .onChange(of: selectedTab) { newValue in
            if newValue == 0 {
                // Сбрасываем путь навигации, чтобы вернуться к HomePageHeader
                navigationPath = NavigationPath()
            }
        }
        .edgesIgnoringSafeArea(.bottom) // Чтобы TabBar не перекрывал содержимое
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(OrderManager()) // Передаём тестовый OrderManager для предпросмотра
    }
}
