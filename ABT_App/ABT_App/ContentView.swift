//
//  ContentView.swift
//  ABT_App
//
//  Created by Adiet Erlanuly on 26.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WelcomeView() // Начальный экран
                .navigationBarHidden(true) // Убираем навигационную панель
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

