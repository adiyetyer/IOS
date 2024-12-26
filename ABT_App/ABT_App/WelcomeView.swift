import SwiftUI

struct WelcomeView: View {
    @State private var navigateToHome = false // Состояние для перехода на следующий экран

    var body: some View {
        ZStack {
            // Градиентный фон
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.0, green: 0.0, blue: 0.5), Color(red: 0.0, green: 0.0, blue: 0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Основной контент
            VStack {
                Spacer() // Отступ сверху
                
                // Название компании
                Text("ABT")
                    .font(Font.custom("KonkhmerSleokchher-Regular", size: 60))
                    .foregroundColor(.white)

                // Подпись "forwarding company"
                Text("forwarding company")
                    .font(Font.custom("Kodchasan-Bold", size: 20))
                    .foregroundColor(.white)

                Spacer() // Разделитель между текстом и нижней подписью

                // Нижняя подпись "by Adiyet Yerlanuly"
                Text("by Adiyet Yerlanuly")
                    .font(Font.custom("Kodchasan-Light", size: 16))
                    .foregroundColor(.white)
                    .padding(.bottom, 30) // Отступ от нижнего края
            }
        }
        .onAppear {
            // Переход на главный экран через 2 секунды
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                navigateToHome = true
            }
        }
        .fullScreenCover(isPresented: $navigateToHome) {
            HomePageHeader() // Переход на HomePageHeader
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
