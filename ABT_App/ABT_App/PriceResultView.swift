import SwiftUI

struct PriceResultView: View {
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
                
                
                    .padding(.horizontal, 20)
            }
        }
    }
    
    struct PriceResultView_Previews: PreviewProvider {
        static var previews: some View {
            PriceResultView(price: 6000)
        }
    }
}
