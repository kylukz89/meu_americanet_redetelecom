 

import Foundation



/**
* Variáveis Globais
* Armazena IP do servidor e demais variáveis diversas
*
*
* @author      Igor Maximo
* @date        15/02/2021
*/
class VariaveisGlobais {
    
    //////////////////////
    // Controle de IPs
    public static var IP = "URL";
    public static var IP_FATURA_DOWNLOADED = "URL"; // central
    //////////////////////
    // Autenticação Back-end
    private static var USER = "";
    private static var PASS = "";
    public static var AUT_GET = "&user=" + USER + "&pass=" + PASS;
    public static var TEMPO_MAX_EXPIRAR = 300; // 5 minutos - Tempo máximo de inatividade do app sem expirar
    //////////////////////
    // Controle de versionamento
    public static var VERSAO_DB = 44;
    public static var VERSAO_APP_LOCAL = [11, 0, 15]
    public static var VERSAO = "\(VERSAO_APP_LOCAL[0]).\(VERSAO_APP_LOCAL[1]).\(VERSAO_APP_LOCAL[2])"
    public static var VERSAO_NOME = "SIMETRA";
    //////////////////////
    // SQLite
    public static var NOME_BANCO_CORE_DATA = "redetelecom.db";
    //////////////////////
    // Conexões por http // PADRÃO 7K
    public static var HTTP_CONNECTION_TIME = 100;
    public static var HTTP_URL_CONNECTION = 95000; // Usado para json
    ////////////////////
    // Mascara Data e Hora
    public static var MASCARA_DATA_HORA = "dd/MM/yyyy";
    public static var QUALIDADE_IMAGEM = 100;
    
}
