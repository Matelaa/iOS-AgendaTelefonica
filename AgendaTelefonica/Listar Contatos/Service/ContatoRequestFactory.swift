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
    
    // Funcao para mapear e fazer o resquest de criar um contato
    static func postCriar(nome: String, aniversario: Int, email: String, telefone: String, avatar: String) -> DataRequest {
        
        let params: Parameters = ["name" : nome, "birth" : aniversario, "email" : email, "phone" : telefone, "picture" : avatar]
        
        return Alamofire.request(baseUrl + "contacts", method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
    }
    
    // Funcao para pegar todos os contatos
    static func getContatos() -> DataRequest {
        
        return Alamofire.request(baseUrl + "contacts", method: .get, headers: header)
    }
    
    // Funcao criada para editar um contato passando seu ID como parametro principal
    static func putEditar(contatoId: Int, nome: String, aniversario: Int, email: String, telefone: String, avatar: String) -> DataRequest {
        
        let params: Parameters = ["name" : nome, "birth" : aniversario, "email" : email, "phone" : telefone, "picture" : avatar]
        
        return Alamofire.request(baseUrl + "contacts/\(contatoId)", method: .put, parameters: params, encoding: JSONEncoding.default, headers: header)
    }
    
    // Funcao criada para deletar um contato passando seu ID como parametro principal
    static func del(contatoId: Int) -> DataRequest {
        
        return Alamofire.request(baseUrl + "contacts/\(contatoId)", method: .delete, encoding: JSONEncoding.default, headers: header)
    }
}
