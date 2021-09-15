 

import Foundation
import UIKit

class Mask {
    
    // Máscara de CPF ou CNPJ para campos de texto
    public func setMascara(number: String) -> String {
        let length: Int = number.count
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = (length == 11 ? "###.###.###-##" : (length > 14 ? "##.###.####/##" : ""))
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "#" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = setMascara(number: newString)
        return false
    }
    
}


 
