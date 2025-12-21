//
//  ContentView.swift
//  Actividad01
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { // vertical alignment
            Text("Tecsup Apps in SwiftUI!")
                .font(.title) // font size
                .foregroundColor(.red) // font color
                .multilineTextAlignment(.center) // alignment
            Text("Developed By: Juan León")
        }
        .padding(20) // text space with the outline

        HStack(alignment: .center, spacing: 20){
            // horizontal alignment
            Text("Activity01")
            Text("Activity02")
            Text("Activity03")
        }

        ZStack{
            // overlay
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200,height: 200)
            Text("Text over the Image")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
