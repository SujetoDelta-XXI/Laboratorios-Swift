//
//  ModeloContainerProvider.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 4/11/25.
//

import Foundation
import SwiftData

@MainActor
class ModelContainerProvider {
    static let shared = ModelContainerProvider()

    let container: ModelContainer

    private init() {

        // Incluimos los 2 modelos: Alumno y Producto
        let schema = Schema([
            Alumno.self,
            Producto.self
        ])

        do {
            let config = ModelConfiguration(
                "Semana11DB",
                schema: schema,
                url: FileManager.default
                    .urls(for: .applicationSupportDirectory, in: .userDomainMask)
                    .first!
                    .appendingPathComponent("Semana11DB.sqlite")
            )

            container = try ModelContainer(
                for: schema,
                configurations: [config]
            )

        } catch {
            fatalError("Error al inicializar ModelContainer: \(error)")
        }
    }
}
