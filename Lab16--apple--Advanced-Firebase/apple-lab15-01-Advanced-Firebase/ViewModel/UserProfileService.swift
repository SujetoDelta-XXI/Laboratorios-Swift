//
//  UserProfileService.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 2/12/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserProfileService: ObservableObject {

    @Published var currentUser: UserProfile?
    private let db = Firestore.firestore()

    // Save user profile to Firestore using merge to avoid resetting taskCount
    func saveUser(displayName: String, lastName: String, description: String) {
        guard let firebaseUser = Auth.auth().currentUser,
              let email = firebaseUser.email else { return }

        // If we have an existing taskCount keep it, otherwise default 0
        let existingCount = currentUser?.taskCount ?? 0

        let user = UserProfile(
            email: email,
            displayName: displayName,
            lastName: lastName,
            description: description,
            taskCount: existingCount
        )

        do {
            // use merge to avoid overwriting taskCount or other fields that may exist
            try db.collection("users").document(firebaseUser.uid).setData(from: user, merge: true)
            self.currentUser = user
            print("User saved successfully!")
        } catch {
            print("Error saving user: \(error)")
        }
    }

    // Load user profile from Firestore and then count tasks owned by the user's email
    func loadUser() {
        guard let firebaseUser = Auth.auth().currentUser,
              let email = firebaseUser.email else { return }

        // First try to load user document (if exists)
        db.collection("users").document(firebaseUser.uid).getDocument { [weak self] document, error in
            guard let self = self else { return }

            if let error = error {
                print("Error loading user document: \(error)")
            }

            if let document = document, document.exists {
                do {
                    // decode user (may or may not include taskCount)
                    self.currentUser = try document.data(as: UserProfile.self)
                } catch {
                    print("Error decoding user: \(error)")
                }
            } else {
                // No document yet: create a default local profile object (taskCount will be set after query)
                self.currentUser = UserProfile(email: email, displayName: "", lastName: "", description: "", taskCount: 0)
            }

            // Regardless of whether the document existed, compute accurate task count from tasks collection
            self.fetchTaskCount(forEmail: email) { count in
                DispatchQueue.main.async {
                    // Ensure we have a currentUser to update
                    if var user = self.currentUser {
                        user.taskCount = count
                        self.currentUser = user
                        // Persist the updated taskCount in the user document (merge so we don't overwrite other fields)
                        self.db.collection("users").document(firebaseUser.uid).setData(["taskCount": count], merge: true) { error in
                            if let error = error {
                                print("Error updating taskCount on user doc: \(error)")
                            }
                        }
                    } else {
                        // If currentUser was nil for some reason, create it with the count
                        let newUser = UserProfile(email: email, displayName: "", lastName: "", description: "", taskCount: count)
                        self.currentUser = newUser
                        // also persist
                        do {
                            try self.db.collection("users").document(firebaseUser.uid).setData(from: newUser, merge: true)
                        } catch {
                            print("Error creating user doc with taskCount: \(error)")
                        }
                    }
                }
            }
        }
    }

    // Counts tasks in Firestore where field "userEmail" == email
    private func fetchTaskCount(forEmail email: String, completion: @escaping (Int) -> Void) {
        db.collection("tasks").whereField("userEmail", isEqualTo: email).getDocuments { snapshot, error in
            if let error = error {
                print("Error counting tasks: \(error)")
                completion(0)
                return
            }
            let count = snapshot?.documents.count ?? 0
            completion(count)
        }
    }

    /// OPTIONAL: call this when you add a task from elsewhere in the app to increment the user's counter locally + firestore.
    func incrementTaskCountLocally() {
        guard let firebaseUser = Auth.auth().currentUser else { return }

        db.collection("users").document(firebaseUser.uid).updateData([
            "taskCount": FieldValue.increment(Int64(1))
        ]) { error in
            if let error = error {
                print("Error incrementing taskCount: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.currentUser?.taskCount += 1
                }
            }
        }
    }
}
