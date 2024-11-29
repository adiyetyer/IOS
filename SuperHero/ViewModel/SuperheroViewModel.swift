import SwiftUI
import Alamofire

class SuperheroViewModel: ObservableObject {
    @Published var superheroes: [Superhero] = []
    @Published var currentSuperhero: Superhero?
    @Published var error: IdentifiableError?

    func fetchSuperheroes() {
        NetworkingManager.shared.fetchSuperheroes { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let superheroes):
                    self?.superheroes = superheroes
                    self?.randomizeSuperhero()
                case .failure(let error):
                    self?.error = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
    }

    func randomizeSuperhero() {
        guard !superheroes.isEmpty else { return }
        currentSuperhero = superheroes.randomElement()
    }
}

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}
