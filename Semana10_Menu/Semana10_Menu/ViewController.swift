//
//  ViewController.swift
//  Semana10_Menu
//
//  Created by Carlos Asparrin on 28/10/25.
//

import UIKit
import SwiftUI

// Controlador principal que muestra un menú SwiftUI y navega a diferentes vistas de UIKit
class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // Fondo blanco para la vista principal
        
        // Creamos una vista SwiftUI con un menú, y le pasamos un closure que se ejecutará
        // cuando se seleccione una opción
        let menuView = MenuNavegacionView { opcion in
            // Según la opción seleccionada, navegamos a la vista correspondiente usando pushViewController
            switch opcion {
            case "vista1":
                self.navigationController?.pushViewController(Vista1ViewController(), animated: true)
            case "vista2":
                self.navigationController?.pushViewController(Vista2ViewController(), animated: true)
            case "vista3":
                self.navigationController?.pushViewController(Vista3ViewController(), animated: true)
            default:
                break // No hacemos nada si se recibe otra opción
            }
        }
        
        // Usamos UIHostingController para incrustar la vista SwiftUI dentro de UIKit
        let hosting = UIHostingController(rootView: menuView)
        
        // Añadimos el hosting controller como hijo del controlador actual
        addChild(hosting)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hosting.view)
        
        // Centramos la vista SwiftUI en el centro de la pantalla
        NSLayoutConstraint.activate([
            hosting.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hosting.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Confirmamos que el controlador hijo fue movido correctamente al controlador padre
        hosting.didMove(toParent: self)
    }
}

