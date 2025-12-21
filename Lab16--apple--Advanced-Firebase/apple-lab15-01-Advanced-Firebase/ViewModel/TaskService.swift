//
//  TaskService.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 5/12/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TaskService: ObservableObject {

    private let db = Firestore.firestore()
    @Published var tasks: [Task] = []

    private var listener: ListenerRegistration?

    // Add a task
    func addTask(title: String, description: String) {

        guard let user = Auth.auth().currentUser else { return }

        let task = Task(
            id: UUID().uuidString,
            title: title,
            description: description,
            userEmail: user.email ?? "Unknown",
            timestamp: Date()
        )

        do {
            try db.collection("tasks")
                .document(task.id)
                .setData(from: task)
        } catch {
            print("Error adding task: \(error)")
        }
    }

    // Listen for real-time updates
    func startListening() {
        listener = db.collection("tasks")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { querySnapshot, error in

                if let error = error {
                    print("Error getting tasks: \(error)")
                    return
                }

                self.tasks = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Task.self)
                } ?? []
            }
    }

    func stopListening() {
        listener?.remove()
        listener = nil
    }
}
