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
}
