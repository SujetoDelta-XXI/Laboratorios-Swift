//
//  NotificationService.swift
//  apple-lab15-01-Advanced-Firebase
//
//  Created by Mac11 on 2/12/25.
//

import Foundation
import FirebaseMessaging
import UserNotifications
import UIKit                // For UIApplication and iOS system APIs
class NotificationService: ObservableObject {
    
    @Published var lastNotification: String?
     
    // Request notification permission
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                    print("Notification permission granted")
                } else {
                    print("Notification permission denied")
                }
            }
        }
    }
    
    // Send local notification (for testing)
    func sendLocalNotification(title: String, subtitle:String , body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error sending local notification: \(error)")
            } else {
                print("Local notification sent")
            }
        }
    }
}
