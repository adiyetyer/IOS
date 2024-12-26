import SwiftUI

struct HomePageHeader: View {
    @State private var selectedTab: String = "History" // Активная вкладка
    @EnvironmentObject var orderManager: OrderManager // Подключаем OrderManager

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    // Верхняя часть
                    HStack {
                        VStack(alignment: .leading, spacing: 1) {
                            Text("Welcome! 🚚")
                                .font(Font.custom("KonkhmerSleokchher-Regular", size: 30))
                                .foregroundColor(.black)

                            Text("Where to deliver?")
                                .font(Font.custom("Kodchasan-Bold", size: 20))
                                .foregroundColor(.black)
                        }

                        Spacer()

                        // Иконка профиля
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 44, height: 44)

                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 31)
                    .padding(.top, 30)

                    // Кнопка "Send Cargo"
                    HStack {
                        Spacer()
                        NavigationLink(destination: SendCargoStep1View()) {
                            Text("send cargo")
                                .font(Font.custom("Kodchasan-Bold", size: 20))
                                .foregroundColor(.black)
                                .frame(width: 328, height: 52)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(20)
                        }
                        Spacer()
                    }
                    .padding(.top, 20)

                    Divider()
                        .frame(height: 1)
                        .background(Color.gray.opacity(0.5))
                        .padding(.vertical, 20)

                    // Вкладки и квадрат
                    VStack(spacing: 10) {
                        // Вкладки
                        HStack(spacing: 20) {
                            Button(action: {
                                selectedTab = "History"
                            }) {
                                Text("History")
                                    .font(Font.custom("Kodchasan-Bold", size: 15))
                                    .foregroundColor(selectedTab == "History" ? .white : .black)
                                    .frame(width: 120, height: 40)
                                    .background(selectedTab == "History" ? Color.black : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                selectedTab = "Delivery Status"
                            }) {
                                Text("Delivery Status")
                                    .font(Font.custom("Kodchasan-Bold", size: 15))
                                    .foregroundColor(selectedTab == "Delivery Status" ? .white : .black)
                                    .frame(width: 120, height: 40)
                                    .background(selectedTab == "Delivery Status" ? Color.black : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }

                        // Квадрат с содержимым
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 350, height: 400) // Фиксированный размер квадрата

                            // Содержимое квадрата
                            VStack {
                                if selectedTab == "History" {
                                    // История заказов
                                    ScrollView {
                                        VStack(spacing: 10) {
                                            // Заголовки колонок
                                            HStack {
                                                Text("ID")
                                                    .font(Font.custom("Kodchasan-Bold", size: 14))
                                                    .frame(width: 100, alignment: .center)

                                                Text("Date")
                                                    .font(Font.custom("Kodchasan-Bold", size: 14))
                                                    .frame(width: 100, alignment: .center)

                                                Text("Destination")
                                                    .font(Font.custom("Kodchasan-Bold", size: 14))
                                                    .frame(width: 130, alignment: .center)
                                            }
                                            .padding(.bottom, 5)

                                            // Данные заказов
                                            ForEach(orderManager.orders) { order in
                                                HStack {
                                                    Text(order.id.uuidString.prefix(8))
                                                        .font(Font.custom("Kodchasan-Light", size: 14))
                                                        .frame(width: 100, alignment: .center)

                                                    Text(order.date.formatted(.dateTime.month().day().hour().minute()))
                                                        .font(Font.custom("Kodchasan-Light", size: 14))
                                                        .frame(width: 100, alignment: .center)

                                                    Text(order.destination)
                                                        .font(Font.custom("Kodchasan-Light", size: 14))
                                                        .frame(width: 130, alignment: .center)
                                                }
                                                .padding(5)
                                                .background(Color.white)
                                                .cornerRadius(10)
                                                .shadow(radius: 2)
                                            }
                                        }
                                        .padding(.horizontal, 10) // Отступы внутри квадрата
                                        .frame(maxWidth: .infinity) // Центрирование содержимого
                                    }
                                } else if selectedTab == "Delivery Status" {
                                    // Статус текущей доставки
                                    VStack(alignment: .center, spacing: 10) {
                                        if let activeOrder = orderManager.activeOrder {
                                            Text("Your delivery on way!")
                                                .font(Font.custom("Kodchasan-Bold", size: 15))
                                            Text("Delivery ID: \(activeOrder.id.uuidString.prefix(8))")
                                                .font(Font.custom("Kodchasan-Light", size: 14))
                                            Text("Current Location: \(activeOrder.status == "в пути" ? "In transit" : "Completed")")
                                                .font(Font.custom("Kodchasan-Light", size: 14))
                                            Text("Approximate Arrival: \(activeOrder.approximateArrival)")
                                                .font(Font.custom("Kodchasan-Light", size: 14))
                                        } else {
                                            Text("You have no deliveries")
                                                .font(Font.custom("Kodchasan-Bold", size: 15))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(10) // Отступы внутри Delivery Status
                                }
                            }
                            .padding() // Отступы между содержимым и краями квадрата
                        }
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true) // Убираем системный navigation bar
        }
    }
}

struct HomePageHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomePageHeader()
            .environmentObject(OrderManager()) // Передаем тестовые данные
    }
}
