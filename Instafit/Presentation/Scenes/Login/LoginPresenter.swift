//
//  LoginPresenter.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Reachability

class LoginPresenter {
    
    fileprivate weak var view: LoginViewProtocol?
    internal let router: LoginRouterProtocol
    internal let interactor: LoginInteractorProtocol
    internal let wireFrame: LoginWireFrameProtocol
        
    init(view: LoginViewProtocol, router: LoginRouterProtocol, interactor: LoginInteractorProtocol, wireFrame: LoginWireFrameProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.wireFrame.setUpView()
        
        
        if AuthManager.shared.login{
            self.router.routeToHome(with: false)
        }

    }
    
}

extension LoginPresenter: LoginPresenterProtocol{
    
    func loginUser(email: String?, password: String?) {
        
        guard let email = email.nilIfEmpty, let password = password.nilIfEmpty else{
            self.view?.showError(message: "Todos los campos son requeridos.")
            return
        }
        Loading.shared.startAnimating(view: self.view as! LoginViewController)
        self.interactor.loginUser(email: email, password: password)
    }
    
    func loginSuccess(){
        Loading.shared.stopAnimating {
            self.router.routeToHome(with: true)
        }
    }
    
    func showError(message: String){
        Loading.shared.stopAnimating {
            self.view?.showError(message: "Login Error.")
        }
    }
}
