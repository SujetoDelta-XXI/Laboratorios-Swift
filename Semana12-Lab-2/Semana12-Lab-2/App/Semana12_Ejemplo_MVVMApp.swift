//
//  Semana12_Ejemplo_MVVMApp.swift
//  Semana12-Lab-2
//
//  Created by Mac11 on 18/11/25.
//

import SwiftUI

@main
struct Semana12_Ejemplo_MVVMApp: App {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
