//
//  AuthManager.swift
//  Instafit
//
//  Created by Jordan Capa on 4/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation


class AuthManager {
    
    static let shared = AuthManager()
    let defaults = UserDefaults.standard
    
    init(){
        
    }
    
    var login: Bool{
        get{
            return defaults.bool(forKey: "isLogin")
        }
        set(value){
            defaults.set(value, forKey: "isLogin")
        }
    }
    
    
}
