//
//  JSON.swift
//  Rede Telecom
//
//  Created by Igor Maximo on 15/02/21.
//

import Foundation


class ManipuladorJSON {
    
    // func que converte string de jsonarray para jsonarray de verdade
    public func setConverterStringJsonParaJSONArray(stringJson: String) -> [Dictionary<String,Any>] {
        let data = stringJson.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : JSONSerialization.ReadingOptions.mutableContainers) as? [Dictionary<String,Any>] {
                return jsonArray // use the json here
            } else {
                print("Formado JSON inválido!")
            }
        } catch let error as NSError {
            print(error)
        }
        return [["ret":"Formado JSON inválido!"]]
    }
}
