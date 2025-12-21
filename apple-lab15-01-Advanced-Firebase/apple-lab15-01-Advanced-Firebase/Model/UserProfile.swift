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
    var messageCount: Int
    
    init(email: String, displayName: String, lastName: String) {
        self.email = email
        self.displayName = displayName
        self.lastName = lastName
        self.messageCount = 0
    }
}
