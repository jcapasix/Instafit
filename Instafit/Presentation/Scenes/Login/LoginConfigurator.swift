//
//  LoginConfigurator.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit

class LoginConfigurator{
    
    // MARK: Object lifecycle
    public static let sharedInstance = LoginConfigurator()
    
    // MARK: Configuration
    
    func configure(_ view: LoginViewProtocol) {
        
        let dataManager = LoginDataManager()
        let interactor = LoginInteractor()
        let wireFrame = LoginWireFrame()
        
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        wireFrame.view = view
        
        let router = LoginRouter(view: view as! LoginViewController)
        let presenter = LoginPresenter(view: view, router: router, interactor: interactor, wireFrame: wireFrame)
        
        interactor.presenter = presenter
        view.presenter = presenter
    }
}
