//
//  LoginRequestFactory.swift
//  AgendaTelefonica
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import Alamofire

class LoginRequestFactory {
    
    // Funcao criada para fazer a requisicao ao postman
    static func postLogin(email: String, senha: String) -> DataRequest {
        
        let params: Parameters = ["email" : email, "password" : senha]
        
        return Alamofire.request(baseUrl + "auth/sign_in", method: .post, parameters: params, encoding: JSONEncoding.default)
    }
}
