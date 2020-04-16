//
//  LoginDataManager.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

class LoginDataManager: LoginDataManagerProtocol {
    
    internal var interactor: LoginInteractorProtocol!
    
    func loginUser(email: String?, password: String?) {
        
        //simulation
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            self.interactor.loginSuccess()
        }
        
    }
    
}
