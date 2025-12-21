//
//  ProfesoresViewController.swift
//  Lab08 -- Asparrin
//
//  Created by Mac11 on 14/10/25.
//

import UIKit

class ProfesoresViewController: UIViewController, UIWebViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaProfesores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "celda")as? PersonasTableViewCell
        cell?.PersonaNombre.text=listaProfesores[indexPath.row].nombre
        cell?.PersonaCurso.text=listaProfesores[indexPath.row].curso
        cell?.PersonaImagen.image=listaProfesores[indexPath.row].foto!
        return cell!

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var profesoresArreglo = ["Jaime Gomez","Silvia Montoya","Godofredo Teobaldo","Sullon Leon","Jaime Farfan"]
    var cursosArreglo = ["Ingenieria de Software","Introduccion al Software","Soluciones en la nube","Movil Avanzado","Base de Datos Avanzado"]
    var imagenArreglo = ["","","","","",""]
    
    var listaProfesores = [
        Profesor(nombre: "Jaime Gomez", curso: "Ingenieria de Software", foto: UIImage(named: "profesor")),
        Profesor(nombre: "Silvia Montoya", curso: "Introduccion al Software", foto: UIImage(named: "profesor")),
        Profesor(nombre: "Godofredo Teobaldo", curso: "Soluciones en la nube", foto: UIImage(named: "profesor")),
        Profesor(nombre: "Sullon Leon", curso: "Movil Avanzando", foto: UIImage(named: "profesor")),
        Profesor(nombre: "Jaime Farfan", curso: "Base de datos Avanzado", foto: UIImage(named: "profesor"))
    ]

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
