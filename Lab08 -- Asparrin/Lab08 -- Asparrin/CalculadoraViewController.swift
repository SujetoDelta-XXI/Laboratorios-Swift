//
//  CalculadoraViewController.swift
//  Lab08 -- Asparrin
//
//  Created by Mac11 on 14/10/25.
//

import UIKit

class CalculadoraViewController: UIViewController {

    
    @IBOutlet weak var firstNumber: UITextField!
    
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var operacion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Calcular(_ sender: Any) {
        let a = Double(firstNumber.text ?? "") ?? 0
        let b = Double(secondNumber.text ?? "") ?? 0
        
        let c = operacion.text ?? ""
        
        var resultado:Double
        
        if c=="+" {
            resultado = a+b
        } else if c=="-" {
            resultado = a-b
        } else if c=="X" || c=="x" {
            resultado = a*b
        }
    }
}
