import SwiftUI

struct ProfileView: View {
    @State private var isEditing = false
    @State private var surnameName = "Surname Name"
    @State private var phoneNumber = "+77771234567"
    @State private var email = "ivanivanov@mail.ru"
    @State private var status = "client"

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea() // Белый фон

                VStack(spacing: 15) { // Уменьшено расстояние между элементами
                    // Верхняя часть с заголовком и аватаркой
                    VStack {
                        HStack {
                            Text("Your Data")
                                .font(Font.custom("Kodchasan-Bold", size: 25)) // Размер заголовка
                                .foregroundColor(.black)
                            Spacer()

                            // Иконка пользователя
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
                        .padding(.horizontal, 20)

                        // Кнопка "Edit"
                        HStack {
                            Button(action: {
                                isEditing.toggle()
                            }) {
                                HStack {
                                    Text("edit")
                                        .font(Font.custom("Kodchasan-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Image(systemName: "pencil")
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 5) // Меньше отступа между "Edit" и заголовком
                    }
                    .padding(.top, 20) // Отступ от верхнего края экрана

                    // Квадрат с данными пользователя
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.2)) // Светло-серый фон
                            .frame(width: 360, height: 460) // Квадрат стал шире и выше

                        VStack(alignment: .leading, spacing: 20) { // Уменьшено расстояние между секциями
                            TextFieldSection(title: "Surname Name", value: $surnameName, isEditing: isEditing, fontSize: 14, fieldWidth: 320)
                            TextFieldSection(title: "Phone Number", value: $phoneNumber, isEditing: isEditing, fontSize: 14, fieldWidth: 320)
                            TextFieldSection(title: "Email", value: $email, isEditing: isEditing, fontSize: 14, fieldWidth: 320)
                            TextFieldSection(title: "Status", value: $status, isEditing: isEditing, fontSize: 14, fieldWidth: 320)
                        }
                        .padding(.horizontal, 40) // Текст внутри квадрата сдвинут правее
                        .padding(.vertical, 20) // Вертикальные отступы
                    }

                    // Контактная информация
                    VStack(spacing: 5) {
                        Text("Contact phone: +77017342233")
                            .font(Font.custom("Kodchasan-Light", size: 12)) // Размер текста
                            .foregroundColor(.black.opacity(0.7))
                        Text("Email: zakaz@abttrans.kz")
                            .font(Font.custom("Kodchasan-Light", size: 12)) // Размер текста
                            .foregroundColor(.black.opacity(0.7))
                    }
                    .padding(.top, 10) // Поднято ближе к квадрату
                    .padding(.bottom, 40) // Отступ снизу для места под TabView
                }
            }
            .navigationBarHidden(true) // Убираем системный navigation bar
        }
    }
}

struct TextFieldSection: View {
    let title: String
    @Binding var value: String
    let isEditing: Bool
    let fontSize: CGFloat
    let fieldWidth: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) { // Расстояние между заголовком и полем
            Text(title)
                .font(Font.custom("Kodchasan-Bold", size: fontSize))
                .foregroundColor(.black)

            if isEditing {
                TextField("", text: $value)
                    .padding(.horizontal, 15) // Внутренние отступы внутри текстового поля
                    .frame(width: fieldWidth, height: 45) // Ширина и высота поля
                    .background(Color.white) // Белый фон
                    .cornerRadius(10) // Закругленные углы
                    .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 2)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: fieldWidth, height: 45) // Ширина и высота поля
                        .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 2)

                    Text(value)
                        .font(Font.custom("Kodchasan-Light", size: fontSize))
                        .foregroundColor(.black.opacity(0.8))
                        .padding(.horizontal, 15) // Внутренние отступы текста
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
