import SwiftUI
import Alamofire
import Kingfisher

struct ContentView: View {
    @StateObject private var viewModel = SuperheroViewModel()

    var body: some View {
        VStack {
            if let superhero = viewModel.currentSuperhero {
                // Изображение супергероя
                KFImage(URL(string: superhero.images.lg))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()

                // Имя супергероя
                Text(superhero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // Статистика супергероя
                VStack(alignment: .leading, spacing: 8) {
                    Text("Full Name: \(superhero.biography.fullName ?? "Unknown")")
                    Text("Intelligence: \(superhero.powerstats.intelligence)")
                    Text("Strength: \(superhero.powerstats.strength)")
                    Text("Speed: \(superhero.powerstats.speed)")
                    Text("Combat: \(superhero.powerstats.combat)")
                }
                .padding()
            } else {
                // Отображение, пока данные загружаются
                Text("Fetching superhero...")
                    .font(.headline)
                    .padding()
            }

            // Кнопка для рандомизации супергероя
            Button(action: {
                viewModel.randomizeSuperhero()
            }) {
                Text("Randomize")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.fetchSuperheroes()
        }
        .alert(item: $viewModel.error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
