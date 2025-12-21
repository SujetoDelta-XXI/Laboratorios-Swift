//
//  UserProfile.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 2/12/25.
//

import Foundation

struct UserProfile: Codable {
    let email: String
    var displayName: String
    var lastName: String
    var description: String
    var taskCount: Int

    init(email: String, displayName: String, lastName: String, description: String = "", taskCount: Int = 0) {
        self.email = email
        self.displayName = displayName
        self.lastName = lastName
        self.description = description
        self.taskCount = taskCount
    }
}

