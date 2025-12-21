//
//  ContentView.swift
//  Semana10_Integracion
//
//  Created by Carlos Asparrin on 28/10/25.
//

import SwiftUI

// Vista principal en SwiftUI – Tecsup
struct ContentView: View {
    var body: some View {
        VStack {
            // Texto superior en SwiftUI
            Text("Vista SwiftUI arriba 👆")
                .font(.title2)
                .padding()

            // Aquí insertamos nuestro UIViewController desde UIKit
            MiViewControllerRepresentable()
                .frame(height: 300) // Altura fija para mostrar el controlador

            // Texto inferior en SwiftUI
            Text("Vista SwiftUI abajo 👇")
                .font(.title2)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
