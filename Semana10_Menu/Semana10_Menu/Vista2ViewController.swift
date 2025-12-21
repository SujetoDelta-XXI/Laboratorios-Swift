//
//  Vista2ViewController.swift
//  Semana10_Menu
//
//  Created by Carlos Asparrin on 28/10/25.
//

import UIKit

class Vista2ViewController: UIViewController {
    
    let capitalTextField = UITextField()
    let tasaTextField = UITextField()
    let aniosTextField = UITextField()
    let resultadoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Vista 2"
        
        configurarTextField(capitalTextField, placeholder: "Monto inicial (capital)")
        configurarTextField(tasaTextField, placeholder: "Tasa anual (%)")
        configurarTextField(aniosTextField, placeholder: "Número de años")
        
        let calcularButton = UIButton(type: .system)
        calcularButton.setTitle("Calcular interés compuesto", for: .normal)
        calcularButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        calcularButton.addTarget(self, action: #selector(calcular), for: .touchUpInside)
        
        resultadoLabel.text = "Monto final:"
        resultadoLabel.font = .systemFont(ofSize: 22)
        resultadoLabel.textAlignment = .center
        
        let volverButton = UIButton(type: .system)
        volverButton.setTitle("⬅️ Volver al menú", for: .normal)
        volverButton.titleLabel?.font = .systemFont(ofSize: 18)
        volverButton.addTarget(self, action: #selector(volverAlMenu), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [
            capitalTextField,
            tasaTextField,
            aniosTextField,
            calcularButton,
            resultadoLabel,
            volverButton
        ])
        stack.axis = .vertical
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            capitalTextField.widthAnchor.constraint(equalToConstant: 250),
            tasaTextField.widthAnchor.constraint(equalToConstant: 250),
            aniosTextField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configurarTextField(_ textField: UITextField, placeholder: String) {
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
    }
    
    @objc func calcular() {
        guard let cText = capitalTextField.text,
              let tText = tasaTextField.text,
              let aText = aniosTextField.text,
              let capital = Double(cText),
              let tasa = Double(tText),
              let anios = Double(aText) else {
            resultadoLabel.text = "❌ Ingrese valores válidos"
            return
        }
        
        let montoFinal = capital * pow(1 + tasa / 100, anios)
        resultadoLabel.text = String(format: "Monto final: S/ %.2f", montoFinal)
    }
    
    @objc func volverAlMenu() {
        navigationController?.popViewController(animated: true)
    }
}

