//
//  Profesor.swift
//  Lab08 -- Asparrin
//
//  Created by Mac11 on 14/10/25.
//

import UIKit

class Profesor: NSObject {

    var nombre:String=""
    var curso:String=""
    var foto:UIImage!
    
    init(nombre: String, curso: String, foto: UIImage!) {
        self.nombre = nombre
        self.curso = curso
        self.foto = foto
    }
}
