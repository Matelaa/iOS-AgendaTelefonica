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

class LoginService {
    
    func postLogin(email: String, senha: String) {
        
        LoginRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data") { (response: DataResponse<User>) in
            
            
            switch response.result {
                
            case .success:
                
                if let user = response.result.value {
                    
                    print("Email: \(user.email ?? "") com id \(user.id ?? 0)")
                }
                
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
    }
}
