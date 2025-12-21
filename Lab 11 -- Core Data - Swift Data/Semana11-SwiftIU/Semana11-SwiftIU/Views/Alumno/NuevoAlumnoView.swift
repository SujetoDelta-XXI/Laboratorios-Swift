//
//  NuevoAlumnoView.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 6/11/25.
//

import SwiftUI
import SwiftData

struct NuevoAlumnoView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var apellido = ""
    @State private var nombre = ""
    @State private var dni = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos del Alumno") {
                    TextField("Apellido", text: $apellido)
                    TextField("Nombre", text: $nombre)
                    TextField("DNI", text: $dni)
                        .keyboardType(.numberPad)
                }
            }

            Button("Guardar Alumno") {

                let nuevoAlumno = Alumno(
                    apellido: apellido,
                    nombre: nombre,
                    dni: dni
                )

                modelContext.insert(nuevoAlumno)

                do {
                    try modelContext.save()
                } catch {
                    print("Error al guardar alumno: \(error)")
                }

                dismiss()
            }
            .disabled(apellido.isEmpty || nombre.isEmpty || dni.isEmpty)
            .navigationTitle("Nuevo Alumno")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
            }
        }
    }
}
