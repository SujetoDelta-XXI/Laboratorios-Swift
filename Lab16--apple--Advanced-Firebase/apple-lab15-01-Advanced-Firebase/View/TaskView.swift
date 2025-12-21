//
//  TaskView.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 5/12/25.
//

import SwiftUI
import FirebaseAuth

struct TaskView: View {
    @StateObject private var taskService = TaskService()

    @State private var title = ""
    @State private var description = ""
    @State private var showingProfile = false
    @State private var showingAPIUsers = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Tasks")
                    .font(.title)
                    .bold()
                Spacer()
                
                Button("API Users") {
                    showingAPIUsers = true
                }
                .padding(8)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Profile") {
                    showingProfile = true
                }
                .padding(8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Sign Out") {
                    try? Auth.auth().signOut()
                }
                .foregroundColor(.red)
            }
            .padding()

            List(taskService.tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)

                    Text(task.description)
                        .font(.subheadline)

                    Text("By: \(task.userEmail)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            VStack {
                TextField("Task title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Task description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Add Task") {
                    if !title.isEmpty && !description.isEmpty {
                        taskService.addTask(title: title, description: description)
                        title = ""
                        description = ""
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            taskService.startListening()
        }
        .onDisappear {
            taskService.stopListening()
        }
        .sheet(isPresented: $showingProfile) {
            UserProfileView()
        }
        .sheet(isPresented: $showingAPIUsers) {
            APIUserListView()
        }
    }
}

#Preview {
    TaskView()
}
