//
//  ContentView.swift
//  Semana12-Lab-2
//
//  Created by Mac11 on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ContactList()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
