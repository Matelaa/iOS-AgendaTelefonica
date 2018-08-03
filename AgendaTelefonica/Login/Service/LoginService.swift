//
//  LoginService.swift
//  AgendaTelefonica
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

protocol LoginServiceDelegate {
    
    func postLoginSuccess()
    func postLoginFailure(error: String)
}

class LoginService {
    
    var delegate: LoginServiceDelegate
    
    required init(delegate: LoginServiceDelegate) {
        self.delegate = delegate
    }
    
    // Funcao criada para fazer a requisicao de entrar no aplicativo caso esteja igual ao postman, passando como parametro seu email e senha
    func postLogin(email: String, senha: String) {
        
        LoginRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data") { (response: DataResponse<User>) in
            
            switch response.result {
                
            case .success:
                
                if let user = response.result.value {
                    
                    user.setHeaderParams(header: response.response?.allHeaderFields)
                    
                    UserViewModel.clear()
                    
                    UserViewModel.save(usuario: user)
                }
                
                self.delegate.postLoginSuccess()
                
            case .failure(let error):
                
                self.delegate.postLoginFailure(error: error.localizedDescription)
            }
        }
    }
}
