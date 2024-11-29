//
//  ContentView.swift
//  SuperheroRandomizer
//
//  Created by Adiet Erlanuly on 28.11.2024.
//
import SwiftUI
import Alamofire

struct ContentView: View {
    @StateObject private var viewModel = SuperheroViewModel()

    var body: some View {
        VStack {
            if let superhero = viewModel.currentSuperhero {
                Text(superhero.name)
                    .font(.largeTitle)
                    .padding()

                if let url = URL(string: superhero.images.lg) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }

                Text("Full Name: \(superhero.biography.fullName)")
                    .padding()

                Text("Intelligence: \(superhero.powerstats.intelligence)")
                Text("Strength: \(superhero.powerstats.strength)")
                Text("Speed: \(superhero.powerstats.speed)")
                Text("Combat: \(superhero.powerstats.combat)")
            } else {
                Text("Fetching superhero...")
            }

            Button(action: {
                viewModel.randomizeSuperhero()
            }) {
                Text("Randomize")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
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


