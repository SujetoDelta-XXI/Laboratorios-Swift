//
//  ContentView.swift
//  Semana13_API
//
//  Created by Mac11 on 18/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar usuario...", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(viewModel.filteredUsers) { user in
                    Text(user.name)
                }
            }
            .navigationTitle("Usuarios - API")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    ContentView()
}

