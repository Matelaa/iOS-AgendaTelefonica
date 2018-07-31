//
//  ContatoRequestFactory.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import Alamofire

class ContatoRequestFactory {
    
    static func postList(nome: String, aniversario: Date, email: String, telefone: String, avatar: String) -> DataRequest {
        
        let params: Parameters = ["name" : nome, "birth" : aniversario, "email" : email, "phone" : telefone, "picture" : avatar]

        return Alamofire.request(baseUrl + "contacts", method: .post, parameters: params, encoding: JSONEncoding.default)
    }
    
    static func getContatos() -> DataRequest {
        
        return Alamofire.request(baseUrl + "contacts", method: .get, headers: header)
    }
}
