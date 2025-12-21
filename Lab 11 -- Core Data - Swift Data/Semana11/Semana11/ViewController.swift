//
//  ViewController.swift
//  Semana11
//
//  Created by Carlos Asparrin on 4/11/25.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Outlet conectado al UITableView del storyboard
    
    @IBOutlet weak var TablaContacto: UITableView!
    

    // Arreglo que almacena los contactos obtenidos desde Core Data
    var contactos: [Contacto] = []

    // Método requerido por UITableViewDataSource para definir el número de filas en la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count   // Devuelve la cantidad de contactos
    }

    // Método requerido por UITableViewDataSource para configurar cada celda de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Reutiliza una celda con identificador "Cell"
        let celda = TablaContacto.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configura el texto principal con el nombre del contacto
        celda.textLabel?.text = contactos[indexPath.row].nombre

        // Configura el texto secundario con teléfono y dirección
        celda.detailTextLabel?.text =
        "\(contactos[indexPath.row].telefono ?? "") | \(contactos[indexPath.row].direccion ?? "")"

        return celda
    }

    // Función que obtiene el contexto de Core Data para operaciones de lectura y escritura
    func conexion() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext   // Retorna el contexto principal
    }

    // Método llamado al cargar la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarInfoCoreData()     // Carga los datos almacenados en Core Data
    }

    // Acción vinculada al botón para agregar un nuevo contacto
    @IBAction func agregarContacto(_ sender: UIBarButtonItem) {
         
        // Crea una alerta con tres campos de texto
        let alert = UIAlertController(title: "Agregar Contacto", message: "Nuevo Contacto", preferredStyle: .alert)

        alert.addTextField { nombreAlert in
            nombreAlert.placeholder = "Nombre"
        }

        alert.addTextField { telefonoAlert in
            telefonoAlert.placeholder = "Telefono"
        }

        alert.addTextField { direccionAlert in
            direccionAlert.placeholder = "Direccion"
        }

        // Acción que se ejecuta al presionar "Aceptar"
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            print("Agregar elemento")

            // Obtiene los valores ingresados
            guard let nombreAlert = alert.textFields?.first?.text else { return }
            guard let telefonoAlert = alert.textFields?[1].text else { return }
            guard let direccionAlert = alert.textFields?.last?.text else { return }

            // Obtiene el contexto
            let contexto = self.conexion()

            // Crea un nuevo objeto Contacto
            let entidadContacto = NSEntityDescription.insertNewObject(forEntityName: "Contacto", into: contexto) as! Contacto

            // Asigna los valores
            entidadContacto.nombre = nombreAlert
            entidadContacto.telefono = telefonoAlert
            entidadContacto.direccion = direccionAlert

            do {
                try contexto.save()             // Guarda en Core Data
                self.cargarInfoCoreData()       // Recargar
            } catch {
                print("Error al guardar el dato")
            }

            // Actualizar tabla
            self.TablaContacto.reloadData()
        }

        // Acción cancelar
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)

        alert.addAction(actionAceptar)
        alert.addAction(actionCancelar)

        present(alert, animated: true, completion: nil)
    }

    // Función que carga los contactos almacenados en Core Data
    func cargarInfoCoreData() {
        let contexto = conexion()
        let fetchRequest: NSFetchRequest<Contacto> = Contacto.fetchRequest()

        do {
            contactos = try contexto.fetch(fetchRequest)
        } catch {
            print("Error al cargar la BD")
        }
    }

    // Función para eliminar un contacto específico dado el índice en la tabla
    func eliminarContacto(at indexPath: IndexPath) {
        let contexto = conexion()
        let contactoEliminar = contactos[indexPath.row]
        contexto.delete(contactoEliminar)

        do {
            try contexto.save()                     // Guarda cambios
            contactos.remove(at: indexPath.row)     // Elimina del arreglo
            TablaContacto.deleteRows(at: [indexPath], with: .automatic) // Actualiza UI
        } catch {
            print("Error al eliminar: \(error)")
        }
    }

    // Método para permitir la eliminación de filas deslizando hacia la izquierda
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            eliminarContacto(at: indexPath)
        }
    }
}
