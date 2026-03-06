//
//  SignModel.swift
//  Vsion
//
//  Created by Luiz Yan on 04/03/26.
//

import Foundation
struct SignModel {
    var password: String = ""
    var email: String = ""
    
    
    //regra pra validar email: precisa conter "@" e "."
    func emailValid() -> Bool {
        return email.contains(Character("@")) && email.contains(Character("."))
    }
    //regra pra validar senha:
    func passwordValid() -> Bool {
        return password.count >= 6
    }
    //condição pra relazar login
    func loginValid() -> Bool {
        
        return emailValid() && passwordValid()
    }
}
