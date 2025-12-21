//
//  APIUserService.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 5/12/25.
//

import Foundation

class APIUserService: ObservableObject {
    @Published var users: [APIUser] = []
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([APIUser].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decoded
                    }
                } catch {
                    print("Decode error:", error)
                }
            }
        }.resume()
    }
}
