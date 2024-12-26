import SwiftUI

struct PriceCalculatorView: View {
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    @State private var weight: String = ""
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var height: String = ""

    @State private var showAlert = false // Показывать предупреждение, если обязательные поля не заполнены
    @State private var calculatedPrice: Int? = nil // Рассчитанная цена доставки
    @State private var showPriceScreen = false // Управление переходом к экрану результата

    let cities = ["Almaty", "Astana", "Shymkent"]

    var body: some View {
        NavigationView {
            ZStack {
                // Фон страницы
                Color.white
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    // Заголовок
                    Text("Price Calculator")
                        .font(Font.custom("Kodchasan-Bold", size: 30))
                        .foregroundColor(.black)
                        .padding(.top, 20)

                    // Поле выбора "From"
                    VStack(alignment: .leading) {
                        Text("From")
                            .font(Font.custom("Kodchasan-Bold", size: 15))
                            .foregroundColor(.black)
                        Picker(selection: $fromCity, label: Text("Select city").foregroundColor(.gray)) {
                            ForEach(cities, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 328, height: 52)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                    }

                    // Поле выбора "To"
                    VStack(alignment: .leading) {
                        Text("To")
                            .font(Font.custom("Kodchasan-Bold", size: 15))
                            .foregroundColor(.black)
                        Picker(selection: $toCity, label: Text("Select city").foregroundColor(.gray)) {
                            ForEach(cities, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 328, height: 52)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                    }

                    // Поле для ввода веса
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Weight (kg)")
                            .font(Font.custom("Kodchasan-Bold", size: 15))
                            .foregroundColor(.black)
                        TextField("Enter weight", text: $weight)
                            .keyboardType(.decimalPad)
                            .frame(width: 328, height: 52)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }

                    // Поля для ввода габаритов (необязательные)
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {
                                Text("Length (cm)")
                                    .font(Font.custom("Kodchasan-Bold", size: 15))
                                    .foregroundColor(.black)
                                TextField("Optional", text: $length)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 150, height: 52)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(15)
                            }

                            VStack(alignment: .leading) {
                                Text("Width (cm)")
                                    .font(Font.custom("Kodchasan-Bold", size: 15))
                                    .foregroundColor(.black)
                                TextField("Optional", text: $width)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 150, height: 52)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(15)
                            }
                        }

                        Text("Height (cm)")
                            .font(Font.custom("Kodchasan-Bold", size: 15))
                            .foregroundColor(.black)
                        TextField("Optional", text: $height)
                            .keyboardType(.decimalPad)
                            .frame(width: 328, height: 52)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }

                    Spacer()

                    // Кнопка "Calculate"
                    NavigationLink(
                        destination: PriceResultView(price: calculatedPrice ?? 0),
                        isActive: $showPriceScreen
                    ) {
                        Text("Calculate")
                            .font(Font.custom("Kodchasan-Bold", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 328, height: 52)
                            .background(Color.black)
                            .cornerRadius(15)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        calculatePrice()
                    })
                    .padding(.bottom, 20)
                    .disabled(fromCity.isEmpty || toCity.isEmpty || weight.isEmpty) // Блокировка кнопки, если обязательные поля не заполнены
                }
                .padding(.horizontal, 20)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all required fields"), dismissButton: .default(Text("OK")))
            }
            .navigationBarHidden(true)
        }
    }
    // Логика проверки обязательных полей
    private func validateFields() -> Bool {
        guard !fromCity.isEmpty, !toCity.isEmpty, !weight.isEmpty else {
            return false
        }

        // Проверка, чтобы вес был числовым значением
        guard Double(weight) != nil else {
            return false
        }

        return true
    }


    // Логика расчета цены
    private func calculatePrice() {
        guard let weightValue = Double(weight), !fromCity.isEmpty, !toCity.isEmpty else {
            showAlert = true
            return
        }

        // Условия расчета
        if (fromCity == "Almaty" && toCity == "Astana") || (fromCity == "Astana" && toCity == "Almaty") {
            calculatedPrice = weightValue <= 25 ? 6000 : 6000 + Int((weightValue - 25) * 125)
        } else if (fromCity == "Almaty" && toCity == "Shymkent") || (fromCity == "Shymkent" && toCity == "Almaty") {
            calculatedPrice = weightValue <= 25 ? 8000 : 8000 + Int((weightValue - 25) * 130)
        } else if (fromCity == "Shymkent" && toCity == "Astana") || (fromCity == "Astana" && toCity == "Shymkent") {
            calculatedPrice = weightValue <= 25 ? 9000 : 9000 + Int((weightValue - 25) * 135)
        } else {
            showAlert = true
            calculatedPrice = nil
        }

        // Если цена рассчитана успешно, переходим к экрану результата
        if calculatedPrice != nil {
            showPriceScreen = true
        }
    }
}
