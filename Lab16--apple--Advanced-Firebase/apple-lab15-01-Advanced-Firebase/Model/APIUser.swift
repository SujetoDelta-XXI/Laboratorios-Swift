//
//  APIUser.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 5/12/25.
//

import Foundation

struct APIUser: Identifiable, Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

