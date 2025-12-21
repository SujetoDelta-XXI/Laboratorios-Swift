//
//  MiViewControllerRepresentable.swift
//  Semana10_Integracion
//
//  Created by Carlos Asparrin on 28/10/25.
//

//Tecsup
import SwiftUI

// Este struct sirve para usar UIViewController en SwiftUI
struct MiViewControllerRepresentable: UIViewControllerRepresentable {

    // Este método crea una instancia del UIViewController (solo una vez)
    func makeUIViewController(context: Context) -> MiViewController {
        return MiViewController() // Retornamos nuestro controlador personalizado
    }

    // Este método actualiza la vista cuando SwiftUI detecta un cambio
    func updateUIViewController(_ uiViewController: MiViewController, context: Context) {
        // No necesitamos hacer nada en esta integración básica
    }
}
