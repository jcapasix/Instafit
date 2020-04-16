//
//  LoginInteractor.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {

    var dataManager: LoginDataManagerProtocol!
    var presenter: LoginPresenterProtocol!
    
    func loginUser(email: String?, password: String?) {
        self.dataManager.loginUser(email: email, password: password)
    }
    
    func loginSuccess(){
        AuthManager.shared.login = true
        self.presenter.loginSuccess()
    }
    
    func showError(message: String){
        self.presenter.showError(message: message)
    }
    
}
