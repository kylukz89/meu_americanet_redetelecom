 
import Foundation
 
 /**
  * Entidade VIEWMODEL que gerencia os dados do usuário autenticado
  *
  * @author        Igor Maximo
  * @date           15/02/2021
  */
 struct Usuario: Decodable {
      
    // Dados do usuário
    let status: String
    let codigo: String
    let nome: String
    let cpfCnpj: String
    let endereco: String
    let bairro: String
    let numero: String
    let cep: String
    let cidade: String
    let uf: String
    let email: String
    // Contatos
    let celular1: String
    let celular2: String
    let celular3: String
    let celular4: String
    // Noggin/Paramout
    let iptvUserApp: String
    let iptvPassApp: String
    
    enum CodingKeys: String, CodingKey {
        
        case status = "STATUS"
        case codigo = "COD_CLIE"
        case nome = "RZAO_SOCL_CLIE"
        case cpfCnpj = "CNPJ_CPF_CLIE"
        case endereco = "ENDER_FAT_LOGR_NOM"
        case bairro = "ENDER_FAT_BAIR_NOM"
        case numero = "ENDER_FAT_NUM"
        case cep = "ENDER_FAT_CEP"
        case cidade = "ENDER_FAT_CDE_NOM" 
        case uf = "ENDER_FAT_UF"
        case email = "ASSINANTE_EMAIL"
        case celular1 = "TELEFONE1"
        case celular2 = "TELEFONE2"
        case celular3 = "TELEFONE3"
        case celular4 = "TELEFONE4"
        case iptvUserApp = "USUR_APP"
        case iptvPassApp = "SEN_APP"
        
    }
 }
