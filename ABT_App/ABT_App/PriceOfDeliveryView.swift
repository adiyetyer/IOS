import SwiftUI

struct PriceOfDeliveryView: View {
    let price: Int // Рассчитанная цена доставки

    var body: some View {
        ZStack {
            // Фон страницы
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Price of Delivery")
                    .font(Font.custom("Kodchasan-Bold", size: 30))
                    .foregroundColor(.black)
                    .padding(.top, 40)

                Text("Your delivery cost is:")
                    .font(Font.custom("Kodchasan-Bold", size: 20))
                    .foregroundColor(.black)

                Text("\(price) KZT")
                    .font(Font.custom("Kodchasan-Bold", size: 40))
                    .foregroundColor(.green)

                Spacer()

                // Кнопка "PAY"
                NavigationLink(destination: CongratulationsView()) {
                    Text("PAY")
                        .font(Font.custom("Kodchasan-Bold", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 328, height: 52)
                        .background(Color.black)
                        .cornerRadius(15)
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct PriceOfDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        PriceOfDeliveryView(price: 6000)
    }
}
