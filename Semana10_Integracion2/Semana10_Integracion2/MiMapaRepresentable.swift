//
//  MiMapaRepresentable.swift
//  Semana10_Integracion2
//
//  Created by Carlos Asparrin on 28/10/25.
//

import SwiftUI
import MapKit

// Este struct permite usar el UIViewController del mapa en SwiftUI
struct MiMapaRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> MiMapaViewController {
        return MiMapaViewController()
    }

    func updateUIViewController(_ uiViewController: MiMapaViewController, context: Context) {
        // No se necesita actualizar el mapa en este ejemplo simple
    }
}
