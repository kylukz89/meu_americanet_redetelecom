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
class AlertToast {
    
    /**
     * Método de exibir mensagem TOAST
     *
     *@author        Igor Maximo
     *@date          15/02/2021
     */
    func setShowToast(controller: UIViewController, message: String, cor: UIColor, secounds: Double = 5) {
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
    func setShowAlertView(_ controller: UIViewController, message: String, titulo: String = "Alerta") -> Void {
        let alert = UIAlertController(title: titulo, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
