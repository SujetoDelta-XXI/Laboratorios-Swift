//
//  ContentView.swift
//  Semana10_Integracion2
//
//  Created by Carlos Asparrin on 28/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Text("🗺️ Mapa desde UIKit")
                .font(.title2)
                .padding()

            // Mostramos el UIViewController del mapa dentro de SwiftUI
            MiMapaRepresentable()
                .frame(height: 600)
                .cornerRadius(12)
                .shadow(radius: 5)

            Text("📍 Ubicación: Lima, Perú")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
