//
//  APIUserListView.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 5/12/25.
//

import SwiftUI

struct APIUserListView: View {
    @StateObject private var apiService = APIUserService()
    
    var body: some View {
        NavigationView {
            List(apiService.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    
                    Text("@\(user.username)")
                        .foregroundColor(.gray)
                    
                    Text(user.email)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("API Users")
        }
        .onAppear {
            apiService.fetchUsers()
        }
    }
}

#Preview {
    APIUserListView()
}
