//
//  Tecsup-Calculadora.swift
//  Actividad01
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct Tecsup_Calculadora: View {
    
    @State private var nota1: String = ""
    @State private var nota2: String = ""
    @State private var nota3: String = ""
    @State private var nota4: String = ""
    @State private var promedio: Double?
    @State private var mensajeError: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                Text("Calculadora de Tecsup")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Campos de texto
                Group {
                    TextField("Ingrese la nota 1", text: $nota1)
                    TextField("Ingrese la nota 2", text: $nota2)
                    TextField("Ingrese la nota 3", text: $nota3)
                    TextField("Ingrese la nota 4", text: $nota4)
                }
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                
                // Botón para calcular promedio
                Button(action: calcularPromedio) {
                    Text("Calcular promedio")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                if !mensajeError.isEmpty {
                    Text(mensajeError)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.horizontal)
                }
                
                if let promedio = promedio {
                    Text("Promedio final: \(Int(promedio))")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 10)
                }
                
                Spacer()
                
                Text("Desa. Por Carlos Alfonso Asparrin Martin")
                    .font(.footnote)
                    .padding(.bottom)
            }
            .padding()
        }
    }
    
    // Función para calcular el promedio
    func calcularPromedio() {
        mensajeError = ""
        promedio = nil
        
        let notasIngresadas = [nota1, nota2, nota3, nota4]
        
        // Verificar si hay alguna nota "AN"
        if notasIngresadas.contains(where: { $0.uppercased() == "AN" }) {
            // Si hay una nota AN, se deben convertir las demás en números válidos
            var notasNumericas: [Double] = []
            
            for n in notasIngresadas {
                if n.uppercased() == "AN" {
                    notasNumericas.append(0) // Consideramos AN como 0
                } else if let valor = Double(n), valor >= 0 && valor <= 20 {
                    notasNumericas.append(valor)
                } else {
                    mensajeError = "Las notas deben estar entre 0 y 20 o ser 'AN'"
                    return
                }
            }
            
            promedio = round(notasNumericas.reduce(0, +) / 4)
            return
        }
        
        // Si no hay AN, procesar normalmente
        var notasValidas: [Double] = []
        for n in notasIngresadas {
            if let valor = Double(n), valor >= 0 && valor <= 20 {
                notasValidas.append(valor)
            } else {
                mensajeError = "Las notas deben estar entre 0 y 20"
                return
            }
        }
        
        // Eliminar la menor nota
        if let menor = notasValidas.min() {
            notasValidas.removeAll { $0 == menor }
        }
        
        // Calcular el promedio redondeado
        promedio = round(notasValidas.reduce(0, +) / Double(notasValidas.count))
    }
}

#Preview {
    Tecsup_Calculadora()
}
