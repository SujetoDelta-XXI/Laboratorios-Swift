//
//  Semana11_SwiftIUApp.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 4/11/25.
//

import SwiftUI
import SwiftData

@main
struct AlumnosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()   // Vista inicial de la app
                
                .modelContainer(ModelContainerProvider.shared.container)
        }
        
    }
}
