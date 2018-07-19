//
//  UserViewModel.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import RealmSwift

class UserViewModel {
    
    // MARK: - Realm
    static func save(usuario: User) {
        
        try! uiRealm.write {
            
            uiRealm.add(usuario, update: true)
        }
    }
    
    static func clear() {
        
        try! uiRealm.write {
            
            let usuarios = uiRealm.objects(User.self)
            
            uiRealm.delete(usuarios)
        }
    }
    
    static func setHeadersParams(headers: [AnyHashable : Any]?) {
        
        guard let headers = headers, let user = uiRealm.objects(User.self).first else {
            return
        }
        
        try! uiRealm.write {
            
            if let accessToken = headers["Access-Token"] as? String {
                user.accessToken = accessToken
            }
            if let client = headers["Client"] as? String {
                user.client = client
            }
            if let uid = headers["Uid"] as? String {
                user.uid = uid
            }
        }
    }
}
