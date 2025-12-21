//
//  CursoFromView.swift
//  Semana09
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct CursoFormView: View {
    @State private var title = ""
    @State private var language = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss

    var onSave: (Cursos) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Título")) {
                    TextField("Título del curso", text: $title)
                }
                Section(header: Text("Idioma")) {
                    TextField("Idioma de programación", text: $language)
                }
                Section(header: Text("Descripción")) {
                    TextField("Descripción del curso", text: $description)
                }
            }
            .navigationTitle("Nuevo Curso")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        let curso = Cursos(title: title, language: language, description: description)
                        onSave(curso)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
