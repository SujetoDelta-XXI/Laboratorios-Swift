//
//  Model.swift
//  Semana12-Lab-2
//
//  Created by Mac11 on 18/11/25.
//

import Foundation
import SwiftUI

// Clase que contiene la lista de contactos
class Model {

    // Arreglo de contactos
    var contacts: [Contact]

    // Inicializador personalizado que carga contactos por defecto
    init() {
        self.contacts = [
            Contact(name: "Juan Leon", phone: "939393939", email: "xxxxx@gmail.com"),
            Contact(name: "Jaime Gomez", phone: "936555555", email: "xxxxx@gmail.com"),
            Contact(name: "Jaime Farfan", phone: "93346765", email: "xxxx@gmail.com"),
            Contact(name: "Silvia Montoya", phone: "93346765", email: "xxxx@gmail.com"),
            Contact(name: "Elliot Garamendi", phone: "93346765", email: "xxxx@gmail.com")
        ]
    }
}

// Estructura que representa un contacto individual
struct Contact: Identifiable {

    // Identificador único automático necesario para usar listas en SwiftUI
    let id = UUID()

    // Nombre del contacto
    let name: String

    // Teléfono del contacto
    let phone: String

    // 📧 Correo electrónico del contacto
    let email: String
}
