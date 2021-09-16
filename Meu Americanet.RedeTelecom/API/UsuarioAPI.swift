 
 import Foundation
 
 /**
  Classe responsável pelas autenticação do usuário
  
  @author        Igor Maximo
  @date           22/08/2021
  */
 class UsuarioAPI :  NSObject {
    
    // MARK:- Retorna os dados de autenticação do usuário pelo CPF/CNPJ
    func getAutenticacaoUsuario(cpfCnpj: String, completionHandler : @escaping (_ success: Bool, _ authData: [UsuarioAutenticacao]) -> ()) {
        // POSTs que servidor deverá receber
        let postString = "cpf_cnpj=" + cpfCnpj
        // Acesso a aplicacao enviando um POST ao servidor
        var request = URLRequest(url: URL(string: Endpoint.SELECT_AUTENTICACAO)!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            
            guard let data = data else {
                // no data
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                let authData = try! jsonDecoder.decode([UsuarioAutenticacao].self, from: data)
                completionHandler(true, authData)
            } catch {
                
            }
            
            
            
            //            if let data = data {
            //                let jsonDecoder = JSONDecoder()
            //                let authData = try! jsonDecoder.decode([UsuarioAutenticacao].self, from: data)
            //                completionHandler(true, authData)
            //
            //            }
        }.resume()
    }
    
    
    
    
    /*
     func getAutenticacaoUsuario(cpfCnpj: String, completion : @escaping (UsuarioAutenticacao) -> ()) {
     // POSTs que servidor deverá receber
     let postString = "cpf_cnpj=" + cpfCnpj
     // Acesso a aplicacao enviando um POST ao servidor
     var request = URLRequest(url: URL(string: Endpoint.SELECT_AUTENTICACAO)!)
     request.httpMethod = "POST"
     request.httpBody = postString.data(using: .utf8)
     URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
     if let data = data {
     let jsonDecoder = JSONDecoder()
     let authData = try! jsonDecoder.decode(UsuarioAutenticacao.self, from: data)
     completion(authData)
     }
     }.resume()
     }
     */
    
    
    
 }
 
 
 
