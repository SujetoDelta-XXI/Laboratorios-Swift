//
//  MiMapaViewController.swift
//  Semana10_Integracion2
//
//  Created by Carlos Asparrin on 28/10/25.
//

import UIKit
import MapKit

// UIViewController que contiene un mapa
class MiMapaViewController: UIViewController {
    let mapa = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Establecer el mapa para ocupar toda la vista
        mapa.frame = view.bounds
        mapa.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapa)

        // Centrar el mapa en una ubicación inicial (Ej. Lima, Perú)
        let coordenada = CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428)
        let region = MKCoordinateRegion(center: coordenada,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)

        mapa.setRegion(region, animated: true)
    }
}

