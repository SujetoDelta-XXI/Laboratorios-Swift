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
    @State private var lastName = ""
    @State private var descriptionText = ""
    @State private var showingEdit = false

    var body: some View {
        VStack(spacing: 18) {
            Text("My Profile")
                .font(.title)
                .bold()

            if let user = profileService.currentUser {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 80, height: 80)
                    .overlay(
                        Text(user.displayName.first?.uppercased() ?? "U")
                            .font(.title)
                            .foregroundColor(.white)
                    )

                Text("\(user.displayName) \(user.lastName)")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(user.email)
                    .font(.caption)
                    .foregroundColor(.gray)

                // Descripción del perfil
                Text(user.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(8)

                // Solo mostrar la cantidad de tareas (sin listar)
                VStack {
                    Text("\(user.taskCount)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    Text("Tareas")
                        .font(.caption)
                }
                .padding()
                .background(Color.gray.opacity(0.08))
                .cornerRadius(10)

                Button("Edit Profile") {
                    displayName = user.displayName
                    lastName = user.lastName
                    descriptionText = user.description
                    showingEdit = true
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(8)
            } else {
                Text("No profile found")
                Button("Create Profile") {
                    displayName = ""
                    lastName = ""
                    descriptionText = ""
                    showingEdit = true
                }
            }

            Spacer()
        }
        .padding()
        .onAppear {
            profileService.loadUser()
        }
        .sheet(isPresented: $showingEdit) {
            NavigationView {
                Form {
                    Section(header: Text("Name")) {
                        TextField("First name", text: $displayName)
                        TextField("Last name", text: $lastName)
                    }
                    Section(header: Text("Description")) {
                        TextField("Description", text: $descriptionText)
                    }
                }
                .navigationTitle("Edit Profile")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            profileService.saveUser(displayName: displayName, lastName: lastName, description: descriptionText)
                            showingEdit = false
                            // reload to refresh taskCount if needed
                            profileService.loadUser()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { showingEdit = false }
                    }
                }
            }
        }
    }
}

#Preview {
    UserProfileView()
}
