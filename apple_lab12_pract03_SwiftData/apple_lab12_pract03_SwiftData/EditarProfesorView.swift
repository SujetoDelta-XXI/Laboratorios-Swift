//
//  EditarProfesorView.swift
//  apple_lab12_pract03_SwiftData
//
//  Created by Mac11 on 11/11/25.
//

import SwiftUI
import SwiftData

struct EditarProfesorView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Bindable var profesor: Profesor

    var body: some View {
        NavigationStack {
            Form {
                Section("Editar Datos del Profesor") {
                    TextField("Apellido", text: $profesor.apellido)
                    TextField("Nombre", text: $profesor.nombre)
                    TextField("Correo", text: $profesor.correo)
                        .keyboardType(.emailAddress)
                    TextField("Teléfono", text: $profesor.number)
                        .keyboardType(.phonePad)
                    DatePicker("Fecha de Nacimiento", selection: $profesor.cumple, displayedComponents: .date)
                    TextField("Profesión", text: $profesor.profesion)
                    DatePicker("Fecha de Contratación", selection: $profesor.fechaContratacion, displayedComponents: .date)
                    Toggle("Activo", isOn: $profesor.active)
                }
            }

            Button("Guardar Cambios") {
                do {
                    try modelContext.save()
                    dismiss()
                } catch {
                    print("Error al guardar los cambios: \(error)")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .navigationTitle("Editar Profesor")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
            }
        }
    }
}

