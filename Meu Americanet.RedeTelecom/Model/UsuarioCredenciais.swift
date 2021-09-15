
import Foundation

struct UsuarioCredenciais {
    var campoCPFCNPJ: String = ""
    var campoSenha: String = ""
    
    init(campoCPFCNPJ :String, campoSenha: String) {
        self.campoCPFCNPJ = campoCPFCNPJ
        self.campoSenha = campoSenha
    }
}
 
// MARK: - Datum
struct UsuarioAutenticacao: Decodable {
    
    let CNPJ_CPF_CLIE: String
    let ASSINANTE_SENHA_PORTAL: String
    let COD_CLIE: Int
    let RZAO_SOCL_CLIE: String
 
}

 
