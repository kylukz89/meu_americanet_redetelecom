//
//  Rotas.swift
//  Rede Telecom
//
//  Created by Igor Maximo on 16/02/21.
//

import Foundation


/**
 Todos os endpoints do backend PHP
 
 @author        Igor Maximo
 @date          22/08/2021
 */
class Endpoint {
    
    ///////////////////////////////////// SELECTS ////////////////////////////////
    public static let ROTA_PADRAO = VariaveisGlobais.IP + "Rotas.php?"; // Arquivo de todas as rotas.
    public static let SELECT_VERSIONAMENTO = ROTA_PADRAO + "func=selectVersionamentoEStatus" + VariaveisGlobais.AUT_GET;
    public static let SELECT_AUTENTICACAO = ROTA_PADRAO + "func=selectAutenticacaoCentralAssinante" + VariaveisGlobais.AUT_GET;
    public static let SELECT_PLANOS_CLIENTE_ROLETA = ROTA_PADRAO + "func=selectPlanosClientePorCodCliRoleta" + VariaveisGlobais.AUT_GET;
    public static let SELECT_DADOS_PLANO_CLIENTE_CODSERCLI = ROTA_PADRAO + "func=selectPlanoClientePorCodSerCli" + VariaveisGlobais.AUT_GET;
    public static let SELECT_DADOS_PLANOS_VENDAS_ONLINE = ROTA_PADRAO + "func=selectTodosPlanosVenda" + VariaveisGlobais.AUT_GET;
    public static let SELECT_DADOS_CLIENTE = ROTA_PADRAO + "func=selectDadosClientePorCPFCNPJ" + VariaveisGlobais.AUT_GET;
    public static let SELECT_TITULOS_FATURAS_CLIENTE_SEGUNDA_VIA = ROTA_PADRAO + "func=selectFaturasClientePorCodCliSegundaVia" + VariaveisGlobais.AUT_GET;
    public static let SELECT_HISTORICO_PAGAMENTOS = ROTA_PADRAO + "func=selectHistoricoPagamentos" + VariaveisGlobais.AUT_GET;
    public static let SELECT_PLANOS_SUSPENSOS_DEBITO_HABILITACAO_PROVISORIA = ROTA_PADRAO + "func=selectPlanosSuspensosClientePorCodCli" + VariaveisGlobais.AUT_GET;
    public static let SELECT_EXTRATO_FINANCEIRO = ROTA_PADRAO + "func=selectExtratoFinanceiroClientePorCodCli" + VariaveisGlobais.AUT_GET;
    public static let SELECT_NOTAS_FISCAIS = ROTA_PADRAO + "func=selectNotasFiscaisCodCli" + VariaveisGlobais.AUT_GET;
    public static let SELECT_ALERTAS_MASSIVOS = ROTA_PADRAO + "func=selectAlertasMassivos" + VariaveisGlobais.AUT_GET;
    public static let SELECT_ALERTAS_PROXIMA_FATURA = ROTA_PADRAO + "func=selectDiasFaltamVencerProximaFatura" + VariaveisGlobais.AUT_GET;
    public static let SELECT_ALERTA_INDIVIDUAL_CLIENTE = ROTA_PADRAO + "func=selectAlertaIndividualCliente" + VariaveisGlobais.AUT_GET;
    public static let SELECT_DETALHES_FATURA = ROTA_PADRAO + "func=selectDetalheFaturaCliente" + VariaveisGlobais.AUT_GET;
    public static let SELECT_LINK_BOLETO_FATURA_MENSALIDADE = ROTA_PADRAO + "func=selectLinkBoletoTitulo" + VariaveisGlobais.AUT_GET;
    public static let SELECT_BOLETO_GERADO = ROTA_PADRAO + "func=selectBoletoGerado" + VariaveisGlobais.AUT_GET;
    public static let SELECT_EXTRATO_CONEXAO_PPPOE = ROTA_PADRAO + "func=selectExtratoConexaoPorPPPoE" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_FOI_GERADO_BOLETO_ANTERIORMENTE = ROTA_PADRAO + "func=selectSeFoiGeradoBoletoAnteriormente" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_APP_HABILITADO_PAGAMENTO_POR_CREDITO = ROTA_PADRAO + "func=selectSeAppBloqueadoPagamentoCredito" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_APP_HABILITADO_PAGAMENTO_POR_DEBITO = ROTA_PADRAO + "func=selectSeAppBloqueadoPagamentoDebito" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_APP_HABILITADO_EMISSAO_BOLETOS = ROTA_PADRAO + "func=selectSeAppBloqueadoEmissaoBoletos" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_APP_HABILITADO_CODIGO_BARRAS = ROTA_PADRAO + "func=selectSeAppBloqueadoCodigoBarras" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_APP_HABILITADO_MUDANCA_PLANO = ROTA_PADRAO + "func=selectSeAppHabilitadoMudancaPlano" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_CODSER_DO_PLANO_CODSERCLI_EM_QUESTAO_E_FIBRA = ROTA_PADRAO + "func=selectSeCodSerdoPlanoCodSerCliAtualEFibra" + VariaveisGlobais.AUT_GET;
    public static let SELECT_QTS_DIAS_PODE_GERAR_BOLETO_VENCIDO = ROTA_PADRAO + "func=selectQtdsDiasPodeGerarBoletoVencido" + VariaveisGlobais.AUT_GET;
    public static let SELECT_TODAS_NOTIFICACOES_USUARIO = ROTA_PADRAO + "func=selectTodasNotificacoesUsuario" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_CLIENTE_EXISTE_BANCO_CLIENTEPOTENCIAL = ROTA_PADRAO + "func=selectSeCPFExisteClientePotencial" + VariaveisGlobais.AUT_GET;
    public static let SELECT_DADOS_CLIENTEPOTENCIAL = ROTA_PADRAO + "func=selectDadosClientePotencial" + VariaveisGlobais.AUT_GET;
    public static let SELECT_MAC_ROTEADOR_BANCO = ROTA_PADRAO + "func=selectMACdoRoteadorBanco" + VariaveisGlobais.AUT_GET;
    public static let SELECT_IP_ROTEADOR_BANCO = ROTA_PADRAO + "func=selectIPdoRoteadorBanco" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SSID_ROTEADOR_BANCO = ROTA_PADRAO + "func=selectSSIDdoRoteadorBanco" + VariaveisGlobais.AUT_GET;
    public static let SELECT_BOTAO_SPEEDTEST = ROTA_PADRAO + "func=selectSeBotaoSpeedTestAtivado" + VariaveisGlobais.AUT_GET;
    public static let SELECT_BOTAO_CODIGO_BARRAS = ROTA_PADRAO + "func=selectCodBarras" + VariaveisGlobais.AUT_GET;
    public static let SELECT_VENCIMENTOS = ROTA_PADRAO + "func=selectVencimentos" + VariaveisGlobais.AUT_GET;
    public static let SELECT_VENCIMENTOS_POR_CODCOB = ROTA_PADRAO + "func=selectVencimentosPorFormaCobranca" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_FORMA_COBRANCA_PLANO_SUPORTA_UPGRADE = ROTA_PADRAO + "func=selectSeFormaCobrancaPlanoSuportaUpgrade" + VariaveisGlobais.AUT_GET;
    public static let SELECT_DADOS_TRANSACAO_DEBITO = ROTA_PADRAO + "func=selectStatusTransacaoDebito" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_CATEGORIA_PLANO_ATUAL_EMPRESARIAL = ROTA_PADRAO + "func=selectTipoCategoriaPlanoAtual" + VariaveisGlobais.AUT_GET;
    public static let SELECT_SE_PLANO_POSSUI_DESCONTOS = ROTA_PADRAO + "func=selectSePlanoPossuiDescontosOuAcrescimos" + VariaveisGlobais.AUT_GET;
    public static let INSERT_DADOS_SPEED_TEST = ROTA_PADRAO + "func=insertDadosSpeedTestBanco" + VariaveisGlobais.AUT_GET;
    public static let INSERT_DADOS_CADASTRO_POTENCIAL_CLIENTE = ROTA_PADRAO + "func=insertCadastraDadosClienteEmPotencial" + VariaveisGlobais.AUT_GET;
    public static let INSERT_ERRO_LOG = ROTA_PADRAO + "func=insertErroLOGApps" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_FIXO_CLIENTE = ROTA_PADRAO + "func=updateFoneFixoCliente" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_CELULAR_CLIENTE = ROTA_PADRAO + "func=updateCelularCliente" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_EMAIL_CLIENTE = ROTA_PADRAO + "func=updateEmailCliente" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_ALTERA_SENHA = ROTA_PADRAO + "func=updateSenhaCentralAssinante" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_DESLOGA_USUARIO = ROTA_PADRAO + "func=registraLOGDeslogarUsuario" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_TOKEN_FIREBASE = ROTA_PADRAO + "func=updateTokenFirebase" + VariaveisGlobais.AUT_GET;   
    public static let UPDATE_MARCA_NOTIFICACOES_LIDAS = ROTA_PADRAO + "func=marcaComoLidaNotificacoes" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_MARCA_MARCA_SIM_NAO = ROTA_PADRAO + "func=marcaSimOuNaoNotificacao" + VariaveisGlobais.AUT_GET;
    public static let UPDATE_GRAVA_AVALIACAO_VISITA_TECNICA = ROTA_PADRAO + "func=setAvaliacaoEstrelasServicoTecnico" + VariaveisGlobais.AUT_GET;
    public static let EXECUTE_HABILITACAO_PROVISORIA = ROTA_PADRAO + "func=executeHabProv" + VariaveisGlobais.AUT_GET;
    public static let EXECUTE_ENVIA_SENHA_EMAIL = ROTA_PADRAO + "func=enviaEmailSenhaCentralAssinante" + VariaveisGlobais.AUT_GET;
    public static let EXECUTE_UPGRADE_PLANO_CLIENTE = ROTA_PADRAO + "func=setUpgradePlanoCliente" + VariaveisGlobais.AUT_GET;
    //////////////////////////////// OPERAÇÕES FINANCEIRAS ////////////////////////
    public static let PAY_MENSALIDADE_SEGVIA = ROTA_PADRAO + "func=payUmaFaturaMensalidadeCreditoDebito" + VariaveisGlobais.AUT_GET; // Para pagar uma mensalidade
    ///////////////////////////////////// REDIRECIONAMENTOS ////////////////////////////////
    public static let REDIRECT_SITE_VENDAS = ROTA_PADRAO + "func=redirectSiteVendas" + VariaveisGlobais.AUT_GET; // Para redirecionar para a plataforma de vendas
}
