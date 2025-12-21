//
//  Profesor.swift
//  apple_lab12_pract03_SwiftData
//
//  Created by Mac11 on 11/11/25.
//

import Foundation

import SwiftData

@Model
class Profesor {
    var idProfesor: UUID
    var apellido: String
    var nombre: String
    var correo: String
    var number: String
    var cumple: Date
    
    var profesion: String
    var fechaContratacion: Date
    var active: Bool
    
    init(idProfesor: UUID = UUID(), apellido: String, nombre: String, correo: String, number: String, cumple: Date, profesion: String, fechaContratacion:Date, active: Bool) {
        self.idProfesor = idProfesor
        self.apellido = apellido
        self.nombre = nombre
        self.correo = correo
        self.number = number
        self.cumple = cumple
        
        self.profesion = profesion
        self.fechaContratacion = fechaContratacion
        self.active = active
    }
}
