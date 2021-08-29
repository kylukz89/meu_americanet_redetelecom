// 
//
//import Foundation
//import Alamofire
//
//class HttpClient{
//    class func certificationsApiCall(typeCertification:Int,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_SQUARE_ID: Flavors.square_id,
//                P_TYPE_CERTIFICATION:typeCertification,
//            ]
//            AlamofireApiCall.DataApiCalling(Api: Configs.Main_api + certifications_api, method: .get, parameter: param) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func currentStageApiCall(completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_SQUARE_ID: Flavors.square_id,
//            ]
//            AlamofireApiCall.DataApiCalling(Api: Configs.Main_api + current_stage_api, method: .get, parameter: param) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func loginApiCall(cpf:String,password:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_CPF: cpf,
//                P_PASSWORD_WORD: password,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            print(param)
//            AlamofireApiCall.UDataApiCalling(Api: Configs.Main_api + client_api, method: .post, parameter: param) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func verifyCpf(cpf:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_CPF: cpf,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            AlamofireApiCall.DataApiCalling(Api: Configs.Main_api + client_cpf_exist_api, method: .get, parameter: param) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func verifyPhone(phone:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_PHONE: phone,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            AlamofireApiCall.DataApiCalling(Api: Configs.Main_api + client_phone_exist_api, method: .get, parameter: param) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    completionClosure(true, jsonObj as AnyObject)
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func verifyEmail(email:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_EMAIL: email,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            AlamofireApiCall.DataApiCalling(Api: Configs.Main_api + client_phone_exist_api, method: .get, parameter: param) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    completionClosure(true, jsonObj as AnyObject)
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func registerApiCall(cpf:String,
//                               password:String,
//                               name:String,
//                               email:String,
//                               phone:String,
//                               addressNumber:String,
//                               address:String,
//                               cep:String,
//                               cod_ibge:String,
//                               district:String,
//                               facebook_id:String,
//                               completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_CPF: cpf,
//                P_PASSWORD: password,
//                P_NAME: name,
//                P_EMAIL : email,
//                P_PHONE : phone,
//                P_ADDRESS_NUMBER : addressNumber,
//                P_ADDRESS : address,
//                P_CEP : cep,
//                P_COD_IBGE : cod_ibge,
//                P_DISTRICT: district,
//                P_FACEBOOK_ID : facebook_id
//            ]
//            AlamofireApiCall.UDataApiCalling(Api: Configs.Main_api + client_register_api, method: .post, parameter: param) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func verifyCep(cep:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            AlamofireApiCall.DataApiCalling(Api: "https://viacep.com.br/ws/\(cep)/json/", method: .get, parameter: nil) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    completionClosure(true, jsonObj as AnyObject)
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func loadCreditCards(token:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_SQUARE_ID: Flavors.square_id
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.DataAuthorizationApiCalling(Api: Configs.Main_api + wallet_api, method: .get, parameter: param,headers: header) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func buyCertificationNewCard(nameCard:String, numberCard:String, flagCard:String, year:String, month:String,cvv:String,certifications:Array<Int64>,token:String,saveCard:Bool,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_SQUARE_ID: Flavors.square_id,
//                P_NAME_CARD: nameCard,
//                P_NUMBER_CARD : numberCard,
//                P_FLAG_CARD : flagCard,
//                P_YEAR_CARD : year,
//                P_MONTH_CARD : month,
//                P_CVV : cvv,
//                P_SAVE_CARD : saveCard,
//                P_CERTIFICATIONS : certifications,
//                P_OPTIN_INSTITUICAO : Flavors.optin
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.UDataAuthorizationApiCalling(Api: Configs.Main_api + sales_api, method: .post, parameter: param,headers: header) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func buyCertificationOldCard(tokenCreditCard:String,certifications:Array<Int64>,token:String,cvv:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_SQUARE_ID: Flavors.square_id,
//                P_TOKEN_CREDIT_CARD: tokenCreditCard,
//                P_CERTIFICATIONS : certifications,
//                P_CVV:cvv,
//            ]
//            
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.UDataAuthorizationApiCalling(Api: Configs.Main_api + sales_api, method: .post, parameter: param,headers: header) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func loadCompetitiveCertifications(token:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_SQUARE_ID : Flavors.square_id
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.DataAuthorizationApiCalling(Api: Configs.Main_api + competitive_certifications_api, method: .get, parameter: param,headers: header) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func sendFeedback(token:String,message:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_FEED_BACK : message,
//                P_SQUARE_ID : Flavors.square_id
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.UDataAuthorizationApiCalling(Api: Configs.Main_api + feedback_api, method: .post, parameter: param,headers: header) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if statusCode == 200 {
//                        completionClosure(true, jsonObj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func loadHistoric(token:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_SQUARE_ID : Flavors.square_id
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.DataAuthorizationApiCalling(Api: Configs.Main_api + historic_certifications_api, method: .get, parameter: param,headers: header) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func loadProfile(token:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.DataAuthorizationApiCalling(Api: Configs.Main_api + client_register_api, method: .get, parameter: param,headers: header) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func updateProfile(token:String,name:String?,email:String?,phone:String?,cep:String?,address:String?,addressNumber:String?,district:String?,codIbge:String?,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            
//            var param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            if(name != nil){
//                param.merge(dict: [P_NAME: name!])
//            }
//            if(email != nil){
//                param.merge(dict: [P_EMAIL: email!])
//            }
//            if(phone != nil){
//                param.merge(dict: [P_PHONE: phone!])
//            }
//            if(cep != nil){
//                param.merge(dict: [P_CEP: cep!])
//            }
//            if(address != nil){
//                param.merge(dict: [P_ADDRESS: address!])
//            }
//            if(addressNumber != nil){
//                param.merge(dict: [P_ADDRESS_NUMBER: addressNumber!])
//            }
//            if(district != nil){
//                param.merge(dict: [P_DISTRICT: district!])
//            }
//            if(codIbge != nil){
//                param.merge(dict: [P_COD_IBGE: codIbge!])
//            }
//            
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.UDataAuthorizationApiCalling(Api: Configs.Main_api + client_register_api, method: .put, parameter: param,headers: header) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let _ = jsonObj["success"] as? Bool{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }else{
//                        completionClosure(true, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func uploadPassword(token:String,password:String,newPassword:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP,
//                P_OLD_PASSWORD_WORD: password,
//                P_NEW_PASSWORD_WORD: newPassword
//            ]
//            
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.UDataAuthorizationApiCalling(Api: Configs.Main_api + client_change_password, method: .put, parameter: param,headers: header) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let _ = jsonObj["success"] as? Bool{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }else{
//                        completionClosure(true, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func deleteCardApi(tokenAuth:String,tokenCard:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(tokenAuth)"
//            ]
//            
//            AlamofireApiCall.UDataAuthorizationApiCalling(Api: Configs.Main_api + wallet_api + "/\(tokenCard)", method: .delete, parameter: param,headers: header) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let _ = jsonObj["success"] as? Bool{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }else{
//                        completionClosure(true, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func recoveryPasswordStageOne(cpf:String,channel:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_CPF: cpf,
//                P_CHANNEL: channel,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            AlamofireApiCall.UDataApiCalling(Api: Configs.Main_api + recovery_password_stage_one, method: .post, parameter: param) { (statusCode,result) in
//
//                if let jsonObj = result as? NSDictionary{
//                    if statusCode == 200 {
//                        completionClosure(true, jsonObj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func recoveryPasswordStageTwo(cod:String,password:String,cpf:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let cpfClear = cpf.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
//            let param: [String: Any] = [
//                P_COD : Int(cod)!,
//                P_NEW_PASSWORD_WORD: password,
//                P_CPF:cpfClear,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            AlamofireApiCall.UDataApiCalling(Api: Configs.Main_api + recovery_password_stage_two, method: .post, parameter: param) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if statusCode == 200 {
//                        completionClosure(true, jsonObj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func refreshToken(token:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_REFRESH_TOKEN : token,
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            AlamofireApiCall.UDataApiCalling(Api: Configs.Main_api + client_api_refresh_token, method: .post, parameter: param) { (statusCode,result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func historicResult(token:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.DataAuthorizationApiCalling(Api: Configs.Main_api + historic_result, method: .get, parameter: param,headers: header) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    class func historicResultStage(token:String,id:String,completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let url = "/resultados/\(id)/?praca_id=\(Flavors.square_id)"
//            let param: [String: Any] = [
//                P_VERSAO_APP: VERSAO_APP
//            ]
//            let header:HTTPHeaders = [
//                "Content-Type":"application/json",
//                "Authorization":"Bearer \(token)"
//            ]
//            AlamofireApiCall.DataAuthorizationApiCalling(Api: Configs.Main_api + url, method: .get, parameter: param,headers: header) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["result"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//    
//    class func textLegalApiCall(completionClosure: @escaping (Bool?, AnyObject?) -> ()){
//        DispatchQueue.main.async {
//            let param: [String: Any] = [
//                P_SQUARE_ID: Flavors.square_id,
//            ]
//            AlamofireApiCall.DataApiCalling(Api: Configs.Main_api + stages, method: .get, parameter: param) { (result) in
//                if let jsonObj = result as? NSDictionary{
//                    if let obj =  jsonObj["texto_aviso_legal"]{
//                        completionClosure(true, obj as AnyObject)
//                    }else{
//                        completionClosure(false, jsonObj as AnyObject)
//                    }
//                }else{
//                    completionClosure(false, "no data" as AnyObject)
//                }
//            }
//        }
//    }
//    
//}
