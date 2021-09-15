//
//  Toast.swift
//  Rede Telecom
//
//  Created by Igor Maximo on 15/02/21.
//

import Foundation
import UIKit
 

/**
 * Responsável por manipular toats e demais exibições ao usuário
 *
 *@author        Igor Maximo
 *@date          15/02/2021
 */
class Alert {
    
    /**
     * Método de exibir mensagem TOAST
     *
     *@author        Igor Maximo
     *@date          15/02/2021
     */
    func setShowToast(_ controller: UIViewController, message: String, cor: UIColor, secounds: Double = 5) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        alert.view.backgroundColor = cor
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + secounds) {
            alert.dismiss(animated: true)
        }
    }
    
    //MARK:- Método de exibir mensagem ALERTVIEW
    func setShowAlertView(_ controller: UIViewController, message: String, titulo: String, _ seApenasAviso: Bool = true) -> Void {
        let alert = UIAlertController(title: titulo, message: message, preferredStyle: UIAlertController.Style.alert)
        if (seApenasAviso) {
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                print("Action")
            }))
        }
        alert.addAction(UIAlertAction(title: (seApenasAviso ? "Cancelar" : "OK"), style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
     
    // MARK:- Exibe spinner na tela
    public static func setSpinner(_ controller: UIViewController, seExibe: Bool, msg: String = "Processando") -> Void {
        let alert = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isUserInteractionEnabled = false
        // Se true, exibe spinner na tela, senao...
        activityIndicator.startAnimating()
        alert.view.addSubview(activityIndicator)
        alert.view.heightAnchor.constraint(equalToConstant: 95).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -20).isActive = true
        (seExibe ? controller.present(alert, animated: true, completion: nil) : controller.dismiss(animated: true, completion: nil)) 
    }
    
    // MARK:- Exibe alert com botões
    public static func setAlert(_ controller: UIViewController, msg: String = "Processando") {
        let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
            }
        }))
        controller.present(alert, animated: true)
    }
}
