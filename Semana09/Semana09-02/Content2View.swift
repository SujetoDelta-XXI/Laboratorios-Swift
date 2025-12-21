//
//  Content2View.swift
//  Semana09
//
//  Created by Mac11 on 21/10/25.
//

import SwiftUI

struct Content2View: View {

    @State private var courses: [Cursos] = [
        Cursos(title: "Fundamentos de Python", language: "Python", description: "Aprende desde cero."),
        Cursos(title: "Desarrollo web", language: "JavaScript", description: "Crea sitios web modernos."),
        Cursos(title: "Apps iOS", language: "Swift", description: "Construye apps móviles.")
    ]
    
    @State private var showingAddCourse = false
    
    var body: some View {
        NavigationView {
            List(courses) { course in
                NavigationLink(destination: CursoDetailView(course: course)) {
                    VStack(alignment: .leading) {
                        Text(course.title)
                            .font(.headline)
                        Text(course.language)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("📘 Cursos")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showingAddCourse = true
                    }) {
                        Label("Agregar", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddCourse) {
                CursoFormView { newCourse in
                    courses.append(newCourse)
                    showingAddCourse = false
                }
            }
        }
    }
}

#Preview {
    Content2View()
}

