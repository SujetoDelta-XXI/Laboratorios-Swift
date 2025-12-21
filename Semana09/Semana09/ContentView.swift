//
//  ContentView.swift
//  Semana09
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    let fruits = ["🍎 Apple", "🍌 Banana", "🍇  Grape", "🍓 Strawberry"]
    
    var body: some View {
        NavigationView{
            List(fruits,id:\.self) { fruit in
                Text(fruit)
            }
            .navigationTitle("Lista de frutas")
        }
    }
}

#Preview {
    ContentView()
}
