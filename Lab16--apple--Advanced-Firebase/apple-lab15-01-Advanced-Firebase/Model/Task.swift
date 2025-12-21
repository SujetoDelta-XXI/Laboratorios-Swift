//
//  Task.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 5/12/25.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let userEmail: String
    let timestamp: Date
}
