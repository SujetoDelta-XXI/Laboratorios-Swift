//
//  AlumnoListView.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 6/11/25.
//

import SwiftUI
import SwiftData

struct AlumnoListView: View {

    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Alumno.apellido) private var alumnos: [Alumno]

    @State private var alumnoSeleccionado: Alumno?
    @State private var mostrarFormulario = false

    var body: some View {
        NavigationSplitView {
            List(selection: $alumnoSeleccionado) {
                ForEach(alumnos) { alumno in
                    NavigationLink(value: alumno) {
                        VStack(alignment: .leading) {
                            Text("\(alumno.apellido), \(alumno.nombre)")
                                .font(.headline)
                            Text("DNI: \(alumno.dni)")
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteAlumno)
            }
            .navigationTitle("👨‍🎓 Alumnos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { EditButton() }
                ToolbarItem {
                    Button { mostrarFormulario = true } label: {
                        Label("Nuevo Alumno", systemImage: "plus")
                    }
                }
            }
        } detail: {
            if let alumno = alumnoSeleccionado {
                VStack(alignment: .leading, spacing: 10) {
                    Text("📄 Detalles del Alumno")
                        .font(.title2)
                    Text("Nombre: \(alumno.nombre)")
                    Text("Apellido: \(alumno.apellido)")
                    Text("DNI: \(alumno.dni)")
                }
                .padding()
            } else {
                Text("Selecciona un alumno")
            }
        }
        .sheet(isPresented: $mostrarFormulario) {
            NuevoAlumnoView()
        }
    }

    private func deleteAlumno(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(alumnos[index])
            }
        }
    }
}

#Preview {
    ContentView()
    //.modelContainer(for: Item.self, inMemory: true)
}
