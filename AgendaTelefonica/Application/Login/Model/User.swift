//
//  User.swift
//  AgendaTelefonica
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var id: Int?
    var email: String?
    var accessToken: String?
    var client: String?
    var uid: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.email <- map["email"]
    }
    
}
