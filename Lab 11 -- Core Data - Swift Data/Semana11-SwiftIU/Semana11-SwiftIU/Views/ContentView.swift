//
//  ContentView.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 4/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            // ✅ Módulo de Alumnos
            AlumnoListView()
                .tabItem {
                    Label("Alumnos", systemImage: "person.3")
                }

            // ✅ Módulo de Productos
            ProductoListView()
                .tabItem {
                    Label("Productos", systemImage: "shippingbox")
                }
        }
    }
}

#Preview {
    ContentView()
}
