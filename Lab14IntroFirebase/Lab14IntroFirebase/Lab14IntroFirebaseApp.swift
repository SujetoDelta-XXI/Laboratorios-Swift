//
//  Lab14IntroFirebaseApp.swift
//  Lab14IntroFirebase
//
//  Created by Mac11 on 25/11/25.
//

import SwiftUI
import FirebaseCore

@main
struct Lab14IntroFirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
