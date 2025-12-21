//
//  SettingsScreen.swift
//  Semana10_SwiftUIEnUIKit
//
//  Created by Carlos Asparrin on 28/10/25.
//

//  Created by Juan León - Jaime Gómez
import SwiftUI

// Define la pantalla de configuración
struct SettingScreen: View {
    // Variable para controlar los interruptores
    @State var isOn = false

    var body: some View {
        // Crea una vista con barra de navegación
        NavigationView {
            // Contenedor tipo formulario
            Form {
                // Agrupa elementos verticalmente
                VStack {
                    // Primer interruptor
                    Toggle(isOn: $isOn, label: {
                        Text("Suscriptor")
                    })

                    // Segundo interruptor (comparte estado con el primero)
                    Toggle(isOn: $isOn, label: {
                        Text("Suscriptor")
                    })

                    // Tercer interruptor (comparte estado con los anteriores)
                    Toggle(isOn: $isOn, label: {
                        Text("Suscriptor")
                    })
                }

                // Espacio flexible
                Spacer()
            }
            // Título en la barra superior
            .navigationTitle("Controles")
        }
    }
}

// Vista previa para Xcode
#Preview {
    SettingScreen()
}
