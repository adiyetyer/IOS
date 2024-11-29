//
//  SuperheroViewModel.swift
//  SuperheroRandomizer
//
//  Created by Adiet Erlanuly on 29.11.2024.
//


import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID() 
    let message: String
}


class SuperheroViewModel: ObservableObject {
    @Published var superheroes: [Superhero] = []
    @Published var currentSuperhero: Superhero?
    @Published var errorMessage: String?
    @Published var error: IdentifiableError?


    func fetchSuperheroes() {
        NetworkingManager.shared.fetchSuperheroes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let superheroes):
                    self.superheroes = superheroes
                    self.randomizeSuperhero()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription

                }
            }
        }
    }

    func randomizeSuperhero() {
        guard !superheroes.isEmpty else { return }
        currentSuperhero = superheroes.randomElement()
    }
}
