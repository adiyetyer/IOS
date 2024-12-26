import SwiftUI

struct SendCargoStep2View: View {
    @State private var fromStreet: String = ""
    @State private var toStreet: String = ""
    @State private var senderName: String = ""
    @State private var navigateToPriceView = false // Управление переходом

    let price: Int // Рассчитанная цена передаётся из Step 1

    var body: some View {
        ZStack {
            // Фон страницы
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Заголовок
                Text("Step 2: Additional Data")
                    .font(Font.custom("Kodchasan-Bold", size: 30))
                    .foregroundColor(.black)
                    .padding(.top, 20)

                // Поля для ввода данных
                VStack(alignment: .leading, spacing: 15) {
                    Text("Address From (Street):")
                        .font(Font.custom("Kodchasan-Bold", size: 15))
                        .foregroundColor(.black)
                    TextField("Enter street", text: $fromStreet)
                        .frame(width: 328, height: 52)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)

                    Text("Address To (Street):")
                        .font(Font.custom("Kodchasan-Bold", size: 15))
                        .foregroundColor(.black)
                    TextField("Enter street", text: $toStreet)
                        .frame(width: 328, height: 52)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)

                    Text("Sender Full Name:")
                        .font(Font.custom("Kodchasan-Bold", size: 15))
                        .foregroundColor(.black)
                    TextField("Enter sender's full name", text: $senderName)
                        .frame(width: 328, height: 52)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                }

                Spacer()

                // Кнопка "NEXT"
                NavigationLink(
                    destination: PriceOfDeliveryView(price: price),
                    isActive: $navigateToPriceView
                ) {
                    Text("NEXT")
                        .font(Font.custom("Kodchasan-Bold", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 328, height: 52)
                        .background(Color.black)
                        .cornerRadius(15)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    navigateToPriceView = true // Активируем переход
                })
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SendCargoStep2View_Previews: PreviewProvider {
    static var previews: some View {
        SendCargoStep2View(price: 6000)
    }
}
