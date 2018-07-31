//
//  SessionControl.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation

var header: [String : String] = [:]

// Classe para fazer as "requisicoes" para ver se tem alguem logado e etc
class SessionControl {
    
    static var isSessionActive: Bool {
        
        if let _ = uiRealm.objects(User.self).first {
            return true
        }
        return false
    }
    
    static func setHeadersParams(headers: [AnyHashable : Any]? = nil) {
        
        header = [:]
        
        // if inverso, que se ele for nulo ele entra
        guard let headers = headers else {
            
            // caso ele nao exista, vai executar esse primeiro comando
            // sem passar parametro
            if let user = uiRealm.objects(User.self).first {
                
                header["Content-Type"] = "application/json"
                
                if let accessToken = user.accessToken {
                    header["Access-Token"] = accessToken
                }
                if let client = user.client {
                    header["Client"] = client
                }
                if let uid = user.uid {
                    header["Uid"] = uid
                }
            }
            
            return
        }
        
        UserViewModel.setHeadersParams(headers: headers)
        
        if let accessToken = headers["Access-Token"] as? String {
            header["Access-Token"] = accessToken
        }
        if let cliet = headers["Client"] as? String {
            header["Client"] = cliet
        }
        if let uid = headers["Uid"] as? String {
            header["Uid"] = uid
        }
    }
}


