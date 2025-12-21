//
//  Post.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 2/12/25.
//

import Foundation
import FirebaseFirestore


struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var content: String
    var authorEmail: String
    var category: String
    var likes: Int
    var isPublished: Bool
    var createdAt: Date
    
    init(title: String, content: String, authorEmail: String, likes: Int, category: String) {
        self.title = title
        self.content = content
        self.authorEmail = authorEmail
        self.category = category
        self.likes = likes
        self.isPublished = true
        self.createdAt = Date()
    }
}
