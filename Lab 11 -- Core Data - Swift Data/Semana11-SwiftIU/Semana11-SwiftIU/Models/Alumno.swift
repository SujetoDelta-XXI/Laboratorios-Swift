//
//  Alumno.swift
//  Semana11-SwiftIU
//
//  Created by Carlos Asparrin on 4/11/25.
//

import Foundation
import SwiftData

@Model
class Alumno {
    var idAlumno: UUID      // Identificador único del alumno, se genera automáticamente con UUID
    var apellido: String
    var nombre: String
    var dni: String

    init(idAlumno: UUID = UUID(), apellido: String, nombre: String, dni: String) {
        self.idAlumno = idAlumno     // Si no se pasa un ID, se genera automáticamente
        self.apellido = apellido
        self.nombre = nombre
        self.dni = dni
    }
}
