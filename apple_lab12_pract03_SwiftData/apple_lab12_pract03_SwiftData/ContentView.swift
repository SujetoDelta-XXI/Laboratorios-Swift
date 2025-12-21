//
//  ContentView.swift
//  apple_lab12_pract03_SwiftData
//
//  Created by Jaime Gomez on 1/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Profesor.apellido) private var profesores: [Profesor]
    @State private var profesorSeleccionado: Profesor?
    @State private var mostrarFormulario = false
    @State private var mostrarEdicion = false
    @State private var textoBusqueda = ""

    var body: some View {
        NavigationSplitView {
            VStack {
                // Buscador
                TextField("Buscar profesor por nombre o apellido", text: $textoBusqueda)
                    .textFieldStyle(.roundedBorder)
                    .padding([.horizontal, .top])

                // Lista filtrada
                List(selection: $profesorSeleccionado) {
                    ForEach(profesoresFiltrados) { profesor in
                        NavigationLink(value: profesor) {
                            VStack(alignment: .leading) {
                                Text("\(profesor.apellido), \(profesor.nombre)")
                                    .font(.headline)
                                Text(profesor.correo)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: deleteProfesores)
                }
            }
            .navigationTitle("Profesores")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        mostrarFormulario = true
                    } label: {
                        Label("Nuevo Profesor", systemImage: "plus")
                    }
                }
            }
        } detail: {
            if let profesor = profesorSeleccionado {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Detalles del Profesor")
                        .font(.title2)
                    Text("Nombre: \(profesor.nombre)")
                    Text("Apellido: \(profesor.apellido)")
                    Text("Correo: \(profesor.correo)")
                    Text("Teléfono: \(profesor.number)")
                    Text("Profesión: \(profesor.profesion)")
                    Text("Nacimiento: \(profesor.cumple.formatted(date: .abbreviated, time: .omitted))")
                    Text("Contratación: \(profesor.fechaContratacion.formatted(date: .abbreviated, time: .omitted))")
                    Text("Activo: \(profesor.active ? "Sí" : "No")")

                    Spacer()

                    Button("Editar Profesor") {
                        mostrarEdicion = true
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top)
                }
                .padding()
                .sheet(isPresented: $mostrarEdicion) {
                    EditarProfesorView(profesor: profesor)
                }
            } else {
                Text("Selecciona un profesor")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
        .sheet(isPresented: $mostrarFormulario) {
            NuevoProfesorView()
        }
    }

    private var profesoresFiltrados: [Profesor] {
        if textoBusqueda.isEmpty {
            return profesores
        } else {
            return profesores.filter {
                $0.nombre.localizedCaseInsensitiveContains(textoBusqueda) ||
                $0.apellido.localizedCaseInsensitiveContains(textoBusqueda)
            }
        }
    }

    private func deleteProfesores(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let profesor = profesoresFiltrados[index]
                modelContext.delete(profesor)
            }

            do {
                try modelContext.save()
            } catch {
                print("Error al eliminar profesor: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Profesor.self, inMemory: true)
}

