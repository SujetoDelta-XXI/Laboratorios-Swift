//
//  NuevoProfesorView.swift
//  apple_lab12_pract03_SwiftData
//
//  Created by Mac11 on 11/11/25.
//

import SwiftUI
import SwiftData

struct NuevoProfesorView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var apellido = ""
    @State private var nombre = ""
    @State private var correo = ""
    @State private var numero = ""
    @State private var cumple = Date()
    @State private var profesion = ""
    @State private var fechaContratacion = Date()
    @State private var activo = true

    @State private var mostrarAlerta = false
    @State private var mensajeError = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos del Profesor") {
                    TextField("Apellido", text: $apellido)
                    TextField("Nombre", text: $nombre)
                    TextField("Correo", text: $correo)
                        .keyboardType(.emailAddress)
                    TextField("Teléfono", text: $numero)
                        .keyboardType(.phonePad)
                    DatePicker("Fecha de Nacimiento", selection: $cumple, displayedComponents: .date)
                    TextField("Profesión", text: $profesion)
                    DatePicker("Fecha de Contratación", selection: $fechaContratacion, displayedComponents: .date)
                    Toggle("Activo", isOn: $activo)
                }
            }

            Button("Guardar Profesor") {
                if validarCampos() {
                    let nuevoProfesor = Profesor(
                        apellido: apellido,
                        nombre: nombre,
                        correo: correo,
                        number: numero,
                        cumple: cumple,
                        profesion: profesion,
                        fechaContratacion: fechaContratacion,
                        active: activo
                    )

                    modelContext.insert(nuevoProfesor)

                    do {
                        try modelContext.save()
                        dismiss()
                    } catch {
                        mensajeError = "Error al guardar profesor: \(error.localizedDescription)"
                        mostrarAlerta = true
                    }
                } else {
                    mostrarAlerta = true
                }
            }
            .disabled(apellido.isEmpty || nombre.isEmpty || correo.isEmpty || profesion.isEmpty)
            .buttonStyle(.borderedProminent)
            .padding()
            .navigationTitle("Nuevo Profesor")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
            }
            .alert("Error", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(mensajeError)
            }
        }
    }

    private func validarCampos() -> Bool {
        let correoRegex = #"^\S+@\S+\.\S+$"#
        guard correo.range(of: correoRegex, options: .regularExpression) != nil else {
            mensajeError = "El correo ingresado no es válido."
            return false
        }

        // Validar fecha de nacimiento no futura
        guard cumple <= Date() else {
            mensajeError = "La fecha de nacimiento no puede ser futura."
            return false
        }

        // Validar fecha de contratación
        guard fechaContratacion > cumple else {
            mensajeError = "La fecha de contratación debe ser posterior a la de nacimiento."
            return false
        }

        // Validar número de teléfono mínimo 6 dígitos
        guard numero.count >= 6 else {
            mensajeError = "El número de teléfono debe tener al menos 6 dígitos."
            return false
        }

        // Todo correcto
        return true
    }
}
