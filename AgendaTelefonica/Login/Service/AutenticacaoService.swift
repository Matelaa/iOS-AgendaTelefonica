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

protocol AutenticacaoServiceDelegate {
    
    func postLoginSuccess()
    func postLoginFailure(error: String)
    func delLogoutSuccess()
    func delLogoutFailure(error: String)
    func postUserSuccess()
    func postUserFailure(error: String)
}

extension AutenticacaoServiceDelegate {
    
    func postLoginSuccess() {
        
        fatalError()
    }
    
    func postLoginFailure(error: String) {
        
        fatalError()
    }
    
    func delLogoutSuccess() {
        
        fatalError()
    }
    
    func delLogoutFailure(error: String) {
        
        fatalError()
    }
    
    func postUserSuccess() {
        
        fatalError()
    }
    
    func postUserFailure(error: String) {
        
        fatalError()
    }
}

class AutenticacaoService {
    
    var delegate: AutenticacaoServiceDelegate
    
    required init(delegate: AutenticacaoServiceDelegate) {
        self.delegate = delegate
    }
    
    // Funcao criada para fazer a requisicao de entrar no aplicativo caso esteja igual ao postman, passando como parametro seu email e senha
    func postLogin(email: String, senha: String) {
        
        AutenticacaoRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data") { (response: DataResponse<User>) in
            
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
    
    func Logout() {
        
        AutenticacaoRequestFactory.delLogout().validate().responseObject { (response: DataResponse<User>) in
            
            switch response.result {
                
            case .success:
                
                ContatosViewModel.clear()
                UserViewModel.clear()
                
                self.delegate.delLogoutSuccess()
                
            case .failure(let error):
                
                self.delegate.delLogoutFailure(error: error.localizedDescription)
            }
        }
    }
    
    func postUser(emailC: String, senhaC: String, confirmarSenhaC: String) {
        
        AutenticacaoRequestFactory.postUser(email: emailC, senha: senhaC, confirmarSenha: confirmarSenhaC).validate().responseJSON { (response: DataResponse<Any>) in
            
            switch response.result {
                
            case .success:
                
                self.delegate.postUserSuccess()
                
            case .failure(let error):
                
                self.delegate.postUserFailure(error: error.localizedDescription)
            }
        }
        
//        AutenticacaoRequestFactory.postUser(email: emailC, senha: senhaC, confirmarSenha: confirmarSenhaC).validate().responseJSON(completionHandler: response: Data) { (response: DataResponse<User>) in
//
//            switch response.result {
//
//            case .success:
//
//                if let user = response.result.value {
//
//                    UserViewModel.clear()
//                    UserViewModel.save(usuario: user)
//                }
//
//                self.delegate.postUserSuccess()
//                
//            case .failure(let error):
//
//                self.delegate.postUserFailure(error: error.localizedDescription)
//            }
//        }
    }
}
