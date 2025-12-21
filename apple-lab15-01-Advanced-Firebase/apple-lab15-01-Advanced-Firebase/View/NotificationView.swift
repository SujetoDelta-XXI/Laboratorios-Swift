//
//  NotificationView.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 2/12/25.
//

import SwiftUI
struct NotificationView: View {
    @StateObject private var notificationService = NotificationService()
    @State private var notificationTitle = "Hello!"
    @State private var notificationSubtitle = "Subtitule"
    @State private var notificationBody = "This is a test notification"
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Push Notifications")
                .font(.title2)
                .fontWeight(.bold)
            
            // Test Local Notifications
            VStack(spacing: 15) {
                Text("Test Notifications")
                    .font(.headline)
                
                TextField("Notification Title", text: $notificationTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Notification Subtitle", text: $notificationSubtitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Notification Body", text: $notificationBody)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Send Test Notification") {
                    notificationService.sendLocalNotification(
                        title: notificationTitle,
                        subtitle: notificationSubtitle,
                        body: notificationBody
                    )
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            notificationService.requestNotificationPermission()
        }
    }
}
#Preview {
    NotificationView()
}

