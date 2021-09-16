
import Foundation
import UIKit

/**
 * Classe VIEWMODEL que gerencia a operação de autenticação
 *
 * @author        Igor Maximo
 * @date           15/02/2021
 */
class LoginViewModel {
    
    // MARK:- Stored Properties
    private let apiUsuario: UsuarioAPI!
    public var campoCPFCNPJ: Observable<String> = Observable("")
    public var campoSenha: Observable<String> = Observable("")
    // MARK:- Observers
    var erroCredenciaisLogin: Observable<String> = Observable("") 
    var errorMessage: Observable<String?> = Observable(nil)
    public var usuarioAuth: UsuarioAutenticacao!
    private var usuarioCredenciais : UsuarioCredenciais!
    
    
    
    var teste: Observable<Usuario?> = Observable(nil)
    
    
    
    // MARK:- Constructor
    init() {
        self.apiUsuario = UsuarioAPI()
        
//        teste.value?.celular1 = "
    }
    
    // MARK:- Validador de credenciais
    func setValidacaoLogin(_ controller: LoginViewController) -> CredentialsInputStatus {
        // Valida se o CPFCNPJ e Senha estão vazios
        if campoCPFCNPJ.value.isEmpty && campoSenha.value.isEmpty {
            erroCredenciaisLogin.value = "CPF/CNPJ e senha não informados!"
            return .Incorreto
        }
        // Valida se CPFCNPJ está vazio
        if campoCPFCNPJ.value.isEmpty {
            erroCredenciaisLogin.value = "CPF/CNPJ e não informado!" 
            return .Incorreto
        }
        // Valida se senha ta vazio
        if campoSenha.value.isEmpty {
            erroCredenciaisLogin.value = "Senha não foi informada!"
            return .Incorreto
        } 
        // Valida se pessoa é física ou jurídica
        var tipo = "F"
        if (campoCPFCNPJ.value.count > 11) {
            tipo = "J"
        }
        // Valida se é pessoa física ou jurídica
        if (tipo == "F") {
            // Valida CPF
            if (!campoCPFCNPJ.value.getSeCPFValido) {
                erroCredenciaisLogin.value = "CPF inválido!"
                return .Incorreto
            } 
        } else {
            // Valida CNPJ
            if (!campoCPFCNPJ.value.getSeCNPJValido) {
                erroCredenciaisLogin.value = "CNPJ inválido!"
                return .Incorreto
            }
        }
        // Consulta API com usuário e senha informados e confronta se estão corretos
        let semaphore = DispatchSemaphore(value: 0)
        self.apiUsuario.getAutenticacaoUsuario(cpfCnpj: self.campoCPFCNPJ.value) { (success, data) in
            self.usuarioAuth = data[0]
            // Carrega var ambiente com dados do usuário
            UserDefaults.standard.set(self.usuarioAuth.CNPJ_CPF_CLIE, forKey: "CNPJ_CPF_CLIE")
            UserDefaults.standard.set(self.usuarioAuth.RZAO_SOCL_CLIE, forKey: "RZAO_SOCL_CLIE")
            semaphore.signal()
        }
        semaphore.wait()
        // Compara as credenciais retornadas da API para validar
        if (String(usuarioAuth?.CNPJ_CPF_CLIE ?? "") != campoCPFCNPJ.value || String(usuarioAuth?.ASSINANTE_SENHA_PORTAL ?? "") != campoSenha.value) {
            print("==============> "+String(usuarioAuth?.CNPJ_CPF_CLIE ?? ""))
            // Valida apenas a senha
            if (String(usuarioAuth?.CNPJ_CPF_CLIE ?? "") == "" || String(usuarioAuth?.CNPJ_CPF_CLIE ?? "").isEmpty) {
                self.erroCredenciaisLogin.value = "CPF/CNPJ não encontrado!"
                return .Incorreto
            }
            // Valida apenas a senha
            if (String(usuarioAuth?.ASSINANTE_SENHA_PORTAL ?? "") != campoSenha.value) {
                self.erroCredenciaisLogin.value = "Senha incorreta!"
                return .Incorreto
            }
            self.erroCredenciaisLogin.value = "Credenciais não condizem!"
            return .Incorreto
        } 
        return .Correto
    }
      
    //MARK:- Consulta os dados da API
    func setLogar(_ controller: LoginViewController) {
        // Redireciona para tela principal com o menu dos planos
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "PrincipalViewController") as! PrincipalViewController
        secondVc.modalPresentationStyle = .fullScreen
        controller.present(secondVc, animated: true, completion: nil)
    }
    // usuarioAuth
}

extension LoginViewModel {
    enum CredentialsInputStatus {
        case Correto
        case Incorreto
    }
}

extension String {
    // Valida CPF
    var getSeCPFValido: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }
        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }
        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])
        var temp1 = 0, temp2 = 0
        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        return temp1 == d1 && temp2 == d2
    }
    // Valida CNPJ
    var getSeCNPJValido: Bool {
        let numbers = compactMap({ Int(String($0)) })
        guard numbers.count == 14 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = 1
            let digit = 11 - slice.reversed().reduce(into: 0) {
                number += 1
                $0 += $1 * number
                if number == 9 { number = 1 }
            } % 11
            return digit > 9 ? 0 : digit
        }
        let dv1 = digitCalculator(numbers.prefix(12))
        let dv2 = digitCalculator(numbers.prefix(13))
        return dv1 == numbers[12] && dv2 == numbers[13]
    }
}
