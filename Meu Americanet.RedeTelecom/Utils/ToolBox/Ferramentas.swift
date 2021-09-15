 

import Foundation
import AudioToolbox
import UIKit

 /**
  * Classe que contem ferramentas genéricas
  * seja para o que for...
  *
  * @author        Igor Maximo
  * @date           24/08/2021
  */
class Ferramentas {
    
    // MARK:- Extrai todos os números de uma string especificada
    public static func setExtrairNumerosString(texto: String) -> String { 
        return String(texto.unicodeScalars.filter(CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "")).contains))
    }
    
    // MARK:- Retorna a data e hora atual
    public static func getDataAtual() -> Date {
        return Date()
    }
    
    // MARK:- Faz o celular vibrar
    public static func setVibrar() -> Void {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate)) 
    }
    
    // MARK:- Máscara monetária para moeda real
    public static func setMascaraDinheiroReal(valor: Float) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current 
        return String(currencyFormatter.string(from: NSNumber(value: valor))!).replacingOccurrences(of: ".", with: ",").replacingOccurrences(of: "¤", with: "")
    }
    
    
}


public extension String {
    // MARK:- Coleta fatia de uma string por 2 index
    public func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from + 1)
        return String(self[start ..< end])
    }
    
    /*
    // MARK:- Coleta o index de um determinado char
    func indexOf(of char: Character) -> Int? {
        return firstIndex(of: char)?.utf16Offset(in: self)
    }
    // MARK:- Coleta fatia de uma string por 2 index
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from + 1)
        return String(self[start ..< end])
    }
    */
}
 
 
 extension UIColor {
    convenience init?(hexString: String?) {
        let input: String! = (hexString ?? "")
            .replacingOccurrences(of: "#", with: "")
            .uppercased()
        var alpha: CGFloat = 1.0
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        switch (input.count) {
        case 3 /* #RGB */:
            red = Self.colorComponent(from: input, start: 0, length: 1)
            green = Self.colorComponent(from: input, start: 1, length: 1)
            blue = Self.colorComponent(from: input, start: 2, length: 1)
            break
        case 4 /* #ARGB */:
            alpha = Self.colorComponent(from: input, start: 0, length: 1)
            red = Self.colorComponent(from: input, start: 1, length: 1)
            green = Self.colorComponent(from: input, start: 2, length: 1)
            blue = Self.colorComponent(from: input, start: 3, length: 1)
            break
        case 6 /* #RRGGBB */:
            red = Self.colorComponent(from: input, start: 0, length: 2)
            green = Self.colorComponent(from: input, start: 2, length: 2)
            blue = Self.colorComponent(from: input, start: 4, length: 2)
            break
        case 8 /* #AARRGGBB */:
            alpha = Self.colorComponent(from: input, start: 0, length: 2)
            red = Self.colorComponent(from: input, start: 2, length: 2)
            green = Self.colorComponent(from: input, start: 4, length: 2)
            blue = Self.colorComponent(from: input, start: 6, length: 2)
            break
        default:
            NSException.raise(NSExceptionName("Invalid color value"), format: "Color value \"%@\" is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", arguments:getVaList([hexString ?? ""]))
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func colorComponent(from string: String!, start: Int, length: Int) -> CGFloat {
        let substring = (string as NSString)
            .substring(with: NSRange(location: start, length: length))
        let fullHex = length == 2 ? substring : "\(substring)\(substring)"
        var hexComponent: UInt64 = 0
        Scanner(string: fullHex)
            .scanHexInt64(&hexComponent)
        return CGFloat(Double(hexComponent) / 255.0)
    }
 }
