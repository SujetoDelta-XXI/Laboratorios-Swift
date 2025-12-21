//
//  User.swift
//  Semana13_API
//
//  Created by Mac11 on 18/11/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
}
