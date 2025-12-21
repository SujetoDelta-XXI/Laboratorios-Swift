//
//  UserProfileView.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 2/12/25.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject private var profileService = UserProfileService()
    
    @State private var displayName = ""
    @State private var lastName = "" // <--- 1. NUEVO ESTADO
    @State private var showingNameInput = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("My Profile")
                .font(.title)
                .fontWeight(.bold)
            
            if let user = self.profileService.currentUser {
                VStack(spacing: 15) {
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Text(user.displayName.prefix(1).uppercased())
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                    
                    // 2. MOSTRAR NOMBRE Y APELLIDO
                    Text("\(user.displayName) \(user.lastName)")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user.email)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("\(user.messageCount)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("Messages")
                                .font(.caption)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    Button("Change Name") {
                        // 3. CARGAR DATOS EXISTENTES PARA EDITAR
                        displayName = user.displayName
                        lastName = user.lastName // Pre-llenar apellido
                        showingNameInput = true
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
            } else {
                // No profile yet
                VStack(spacing: 15) {
                    Text("No profile found")
                        .font(.headline)
                    
                    Text("Create your profile to get started!")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Button("Create Profile") {
                        // Limpiar campos al crear nuevo
                        displayName = ""
                        lastName = ""
                        showingNameInput = true
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            profileService.loadUser()
        }
        .alert("Enter Your Details", isPresented: $showingNameInput) {
            // 4. AGREGAR LOS CAMPOS DE TEXTO EN EL ALERT
            TextField("First Name", text: $displayName)
            TextField("Last Name", text: $lastName) // Nuevo campo
            
            Button("Save") {
                if !displayName.isEmpty && !lastName.isEmpty {
                    // 5. LLAMAR A LA FUNCIÓN ACTUALIZADA
                    profileService.saveUser(displayName: displayName, lastName: lastName)
                }
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please enter your first and last name")
        }
    }
}

#Preview {
    UserProfileView()
}



