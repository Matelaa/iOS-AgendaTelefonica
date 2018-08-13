//
//  LoginRequestFactory.swift
//  AgendaTelefonica
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import Alamofire

class AutenticacaoRequestFactory {
    
    // Funcao criada para fazer a requisicao ao postman
    static func postLogin(email: String, senha: String) -> DataRequest {
        
        let params: Parameters = ["email" : email, "password" : senha]
        
        return Alamofire.request(baseUrl + "auth/sign_in", method: .post, parameters: params, encoding: JSONEncoding.default)
    }
    
    static func delLogout() -> DataRequest {
        
        return Alamofire.request(baseUrl + "auth/sign_out", method: .delete, headers: header)
    }
    
    static func postUser(email: String, senha: String, confirmarSenha: String) -> DataRequest {
        
        let params: Parameters = ["email": email, "password": senha, "password_confirmation": confirmarSenha]
        
        return Alamofire.request(baseUrl + "auth", method: .post, parameters: params, encoding: JSONEncoding.default)
    }
}
