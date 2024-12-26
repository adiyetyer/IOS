import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        ZStack {
            // Фон страницы
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Congratulations!")
                    .font(Font.custom("Kodchasan-Bold", size: 30))
                    .foregroundColor(.green)
                    .padding(.top, 40)

                Text("Your order has been successfully placed.")
                    .font(Font.custom("Kodchasan-Bold", size: 20))
                    .foregroundColor(.black)

                Text("Order ID: \(UUID().uuidString.prefix(8))")
                    .font(Font.custom("Kodchasan-Bold", size: 20))
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
