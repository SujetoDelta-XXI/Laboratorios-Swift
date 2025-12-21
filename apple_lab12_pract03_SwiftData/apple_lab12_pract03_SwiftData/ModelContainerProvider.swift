//
//  ModelContainerProvider.swift
//  apple_lab12_pract03_SwiftData
//
//  Created by Mac11 on 11/11/25.
//

import Foundation
import SwiftData

@MainActor
class ModelContainerProvider {
    static let shared = ModelContainerProvider()

    let container: ModelContainer

    private init() {

        let schema = Schema([
            Profesor.self
        ])

        do {
            let config = ModelConfiguration(
                "ProfesorDB",
                schema: schema,
                url: FileManager.default
                    .urls(for: .applicationSupportDirectory, in: .userDomainMask)
                    .first!
                    .appendingPathComponent("ProfesorDB.sqlite")
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


