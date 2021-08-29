//
//  Credentials.swift
//  Meu Americanet.RedeTelecom
//
//  Created by Igor Maximo on 22/08/21.
//

 



import Foundation

struct UsuarioCredenciais : Decodable {
    var campoCPFCNPJ: String = ""
    var campoSenha: String = ""
}

// MARK: - Datum
struct CredenciaisData: Decodable {
    
    let campoCPFCNPJ: String
    let campoSenha: String
    let codClie: String
    let razaoSocialNome: String

    enum CodingKeys: String, CodingKey {
        
        case campoCPFCNPJ = "CNPJ_CPF_CLIE"
        case campoSenha = "ASSINANTE_SENHA_PORTAL"
        case codClie = "COD_CLIE"
        case razaoSocialNome = "RZAO_SOCL_CLIE"
    }
}

