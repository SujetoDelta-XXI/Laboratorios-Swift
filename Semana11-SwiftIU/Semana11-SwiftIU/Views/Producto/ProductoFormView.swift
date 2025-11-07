//
//  ProductoFormView.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 6/11/25.
//

import SwiftUI
import SwiftData

struct ProductoFormView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    var producto: Producto?

    @State private var nombre = ""
    @State private var precio = ""
    @State private var stock = ""
    @State private var categoria = ""

    var body: some View {
        NavigationStack {

            Form {
                Section("Datos del Producto") {
                    TextField("Nombre", text: $nombre)

                    TextField("Precio", text: $precio)
                        .keyboardType(.decimalPad)

                    TextField("Stock", text: $stock)
                        .keyboardType(.numberPad)

                    TextField("Categoría", text: $categoria)
                }
            }
            .navigationTitle(producto == nil ? "Nuevo Producto" : "Editar Producto")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        guardar()
                    }
                    .disabled(nombre.isEmpty || precio.isEmpty || stock.isEmpty || categoria.isEmpty)
                }
            }
            .onAppear {
                if let producto {
                    nombre = producto.nombre
                    precio = String(producto.precio)
                    stock = String(producto.stock)
                    categoria = producto.categoria
                }
            }
        }
    }

    private func guardar() {

        if let producto {
            // Editar existente
            producto.nombre = nombre
            producto.precio = Double(precio) ?? 0
            producto.stock = Int(stock) ?? 0
            producto.categoria = categoria

        } else {
            // Crear nuevo
            let nuevo = Producto(
                nombre: nombre,
                precio: Double(precio) ?? 0,
                stock: Int(stock) ?? 0,
                categoria: categoria
            )
            modelContext.insert(nuevo)
        }

        do {
            try modelContext.save()
        } catch {
            print("Error al guardar producto: \(error)")
        }

        dismiss()
    }
}

