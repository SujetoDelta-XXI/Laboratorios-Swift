//
//  Ventana2.swift
//  Actividad01
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct Ventana2: View {
    var body: some View {
        VStack{
            Text("Tecsup -Software").font(.largeTitle)

            HStack{
                Text("Left")
                Spacer()
                Text("Right")
            }
            .padding()
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width:200, height: 200)
                Text("5th Cycle Students")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    Ventana2()
}
