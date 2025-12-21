//
//  ContentView.swift
//  Semana12-Lab
//
//  Created by Mac11 on 18/11/25.
//

import SwiftUI
import SwiftData

class BadCounter: ObservableObject {
    var count = 0
}

class GoodCounter: ObservableObject {
    @Published var count = 0
}

struct ExamplePublishedView: View {

    @StateObject var badCounter = BadCounter()
    @StateObject var goodCounter = GoodCounter()

    var body: some View {
        VStack {

            VStack {
                Text("Count: \(badCounter.count)")
                Button("Add") {
                    self.badCounter.count += 1
                }.buttonStyle(.bordered)
            }

            Divider()

            VStack {
                Text("Count: \(goodCounter.count)")
                Button("Add") {
                    self.goodCounter.count += 1
                }.buttonStyle(.bordered)
            }

        }
    }
}

#Preview {
    ExamplePublishedView()
}

