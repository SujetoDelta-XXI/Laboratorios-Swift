//
//  Vista3ViewController.swift
//  Semana10_Menu
//
//  Created by Carlos Asparrin on 28/10/25.
//

import UIKit

class Vista3ViewController: UIViewController {
    
    let montoTextField = UITextField()
    let tasaTextField = UITextField()
    let plazoTextField = UITextField()
    
    let cuotaLabel = UILabel()
    let totalLabel = UILabel()
    let interesLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Vista 3"
        
        configurarTextField(montoTextField, placeholder: "Monto del préstamo (S/)")
        configurarTextField(tasaTextField, placeholder: "TEA (%)")
        configurarTextField(plazoTextField, placeholder: "Plazo (meses)")
        
        let calcularButton = UIButton(type: .system)
        calcularButton.setTitle("Calcular préstamo", for: .normal)
        calcularButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        calcularButton.addTarget(self, action: #selector(calcular), for: .touchUpInside)
        
        cuotaLabel.text = "Cuota mensual:"
        cuotaLabel.font = .systemFont(ofSize: 20)
        cuotaLabel.textAlignment = .center
        
        totalLabel.text = "Monto total:"
        totalLabel.font = .systemFont(ofSize: 20)
        totalLabel.textAlignment = .center
        
        interesLabel.text = "Interés total:"
        interesLabel.font = .systemFont(ofSize: 20)
        interesLabel.textAlignment = .center
        
        let volverButton = UIButton(type: .system)
        volverButton.setTitle("⬅️ Volver al menú", for: .normal)
        volverButton.titleLabel?.font = .systemFont(ofSize: 18)
        volverButton.addTarget(self, action: #selector(volverAlMenu), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [
            montoTextField,
            tasaTextField,
            plazoTextField,
            calcularButton,
            cuotaLabel,
            totalLabel,
            interesLabel,
            volverButton
        ])
        stack.axis = .vertical
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            montoTextField.widthAnchor.constraint(equalToConstant: 260),
            tasaTextField.widthAnchor.constraint(equalToConstant: 260),
            plazoTextField.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
    
    private func configurarTextField(_ textField: UITextField, placeholder: String) {
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
    }
    
    @objc func calcular() {
        guard let montoTxt = montoTextField.text,
              let tasaTxt = tasaTextField.text,
              let plazoTxt = plazoTextField.text,
              let monto = Double(montoTxt),
              let tasa = Double(tasaTxt),
              let plazo = Double(plazoTxt)
        else {
            cuotaLabel.text = "❌ Datos inválidos"
            return
        }
        
        // i = tasa / 12 / 100
        let i = tasa / 12 / 100
        let n = plazo
        
        // cuota = monto × [i × (1 + i)^n] / [(1 + i)^n – 1]
        let powValue = pow(1 + i, n)
        let cuota = monto * (i * powValue) / (powValue - 1)
        
        // montoTotal = cuota × n
        let montoTotal = cuota * n
        
        // interesTotal = montoTotal – monto
        let interesTotal = montoTotal - monto
        
        cuotaLabel.text = String(format: "Cuota mensual: S/ %.2f", cuota)
        totalLabel.text = String(format: "Monto total: S/ %.2f", montoTotal)
        interesLabel.text = String(format: "Interés total: S/ %.2f", interesTotal)
    }
    
    @objc func volverAlMenu() {
        navigationController?.popViewController(animated: true)
    }
}

