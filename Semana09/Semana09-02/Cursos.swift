//
//  Cursos.swift
//  Semana09
//
//  Created by Mac11 on 21/10/25.
//

import Foundation

class Cursos: Identifiable, ObservableObject {
    let id=UUID()
    let title:String
    let language:String
    let description:String
    
    init(title:String, language:String, description:String) {
        self.title=title
        self.language=language
        self.description=description
    }
}
