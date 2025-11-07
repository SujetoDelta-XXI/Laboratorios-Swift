//
//  ProductoListView.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 6/11/25.
//

import SwiftUI
import SwiftData

struct ProductoListView: View {

    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Producto.nombre) private var productos: [Producto]

    @State private var productoSeleccionado: Producto?
    @State private var mostrarFormulario = false

    var body: some View {

        NavigationSplitView {

            List(selection: $productoSeleccionado) {
                ForEach(productos) { producto in
                    NavigationLink(value: producto) {
                        VStack(alignment: .leading) {
                            Text(producto.nombre)
                                .font(.headline)
                            Text("S/ \(producto.precio, format: .number)")
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteProductos)
            }
            .navigationTitle("📦 Productos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        mostrarFormulario = true
                    } label: {
                        Label("Nuevo", systemImage: "plus")
                    }
                }
            }

        } detail: {

            if let producto = productoSeleccionado {
                VStack(alignment: .leading, spacing: 10) {

                    Text("📄 Detalles del Producto")
                        .font(.title2)

                    Text("Nombre: \(producto.nombre)")
                    Text("Precio: S/ \(producto.precio, format: .number)")
                    Text("Stock: \(producto.stock)")
                    Text("Categoría: \(producto.categoria)")
                }
                .padding()

            } else {
                Text("Selecciona un producto")
            }
        }
        .sheet(isPresented: $mostrarFormulario) {
            ProductoFormView()
        }
    }

    private func deleteProductos(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let producto = productos[index]
                modelContext.delete(producto)
            }
        }
    }
}

#Preview {
    ProductoListView()
}
