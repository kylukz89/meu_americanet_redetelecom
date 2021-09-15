 
import Foundation
 
//MARK:- Coleta os dados de todos os contratos do usuário para ilustrar na roleta
 struct ContratoRoleta: Decodable {
    
    let status: String
    let nomePlano: String
    let enderecoInstalacaoTipo: String
    let enderecoInstalacaoRua: String
    let enderecoInstalacaoNumero: String
    let bairroInstalacao: String
    let cepInstalacao: String
    let cidade: String
    let codContrato: Int
    let vencimentoDia: Int
    let valorFinal: Float
    
    enum CodingKeys: String, CodingKey {
        
        case status = "DESCR_STAT_CNTR"
        case nomePlano = "PRODUTO_NOME"
        case enderecoInstalacaoTipo = "ENDER_INSTALACAO_LOGR_TIPO"
        case enderecoInstalacaoRua = "ENDER_INSTALACAO_LOGR_NOM"
        case enderecoInstalacaoNumero = "ENDER_INSTALACAO_NUM"
        case bairroInstalacao = "ENDER_INSTALACAO_BAIR_NOM"
        case cepInstalacao = "ENDER_COB_CEP"
        case cidade = "ENDER_INSTALACAO_CDE_NOM"
        case codContrato = "COD_CNTR"
        case vencimentoDia = "DIA_VENC"
        case valorFinal = "VLR_CNTR"
    }
}
