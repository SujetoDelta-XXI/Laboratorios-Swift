//
//  ViewController.swift
//  Semana10_SwiftUIEnUIKit
//
//  Created by Carlos Asparrin on 28/10/25.
//

//  Created by Juan León - Jaime Gómez
// Importamos UIKit para trabajar con los componentes de interfaz tradicionales
import UIKit
// Importamos SwiftUI para poder integrar vistas modernas
import SwiftUI

// Definimos un controlador de vista tradicional de UIKit
class ViewController: UIViewController {

    // Este método se ejecuta cuando la vista se carga en memoria
    override func viewDidLoad() {
        // Llamamos al método de la clase padre
        super.viewDidLoad()

        // Creamos un botón con un tamaño y posición específicos
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 50))

        // Añadimos el botón a la vista principal
        view.addSubview(button)

        // Colocamos el botón en el centro de la pantalla
        button.center = view.center

        // Establecemos el texto del botón
        button.setTitle("Mostrar SwiftUI", for: .normal)

        // Cambiamos el color de fondo del botón al azul estándar del sistema
        button.backgroundColor = .systemBlue

        // Configuramos el botón para que llame al método didTapButton cuando se pulse
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    // Método que se ejecuta cuando se toca el botón
    // @objc es necesario para que este método sea accesible desde UIKit
    @objc func didTapButton() {
        // Creamos un controlador especial que puede contener una vista de SwiftUI
        let vc = UIHostingController(rootView: SettingScreen())

        // Presentamos la vista SwiftUI como una pantalla modal
        present(vc, animated: true)
    }
}


