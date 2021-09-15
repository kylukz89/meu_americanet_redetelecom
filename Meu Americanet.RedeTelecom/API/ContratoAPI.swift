 
 import Foundation
 
 /**
  Classe responsável pelos contratos do usuário
  
  @author        Igor Maximo
  @date           03/09/2021
  */
 class ContratoAPI: NSObject {
    
    // MARK:- Retorna os dados de autenticação do usuário pelo CPF/CNPJ
    func getTodosContratosCliente(cpfCnpj: String, completionHandler : @escaping (_ success: Bool, _ authData: [ContratoRoleta]) -> ()) {
        // POSTs que servidor deverá receber
        let postString = "cpf_cnpj=" + cpfCnpj
        // Acesso a aplicacao enviando um POST ao servidor
        var request = URLRequest(url: URL(string: Endpoint.SELECT_PLANOS_CLIENTE_ROLETA)!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder() 
                let data = try! jsonDecoder.decode([ContratoRoleta].self, from: data)
                completionHandler(true, data)
            }
        }.resume()
    }
 }
