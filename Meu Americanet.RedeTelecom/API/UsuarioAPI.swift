 
import Foundation
 
/**
  Classe responsável pelas autenticação do usuário
  
  @author       Igor Maximo
  @date           22/08/2021
*/
class Usuario :  NSObject {
     
    func getAutenticacaoUsuario(completion : @escaping (Credenciais) -> ()) {
        
        print("bateu api")
        
//        URLSession.shared.dataTask(with: URL(string: Endpoints.SELECT_AUTENTICACAO)!) { (data, urlResponse, error) in
//            if let data = data {
//                let jsonDecoder = JSONDecoder()
//                let empData = try! jsonDecoder.decode(Credenciais.self, from: data)
//
//                print(empData)
//
//                completion(empData)
//            }
//        }.resume()
    }
}
