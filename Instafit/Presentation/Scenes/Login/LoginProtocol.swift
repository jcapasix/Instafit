//
//  LoginProtocols.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol! { get set }
    func showError(message: String)
}

protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol { get }
    var interactor: LoginInteractorProtocol { get }
    func loginUser(email:String?, password:String?)
    func loginSuccess()
    func showError(message: String)
}

protocol LoginRouterProtocol {
//    func routeToHome()
    func routeToHome(with animate:Bool)
}

protocol LoginConfiguratorProtocol {
    func configure(_ view: LoginViewProtocol)
}

protocol LoginInteractorProtocol{
    var presenter: LoginPresenterProtocol! { get set }
    var dataManager: LoginDataManagerProtocol! { get set }

    func loginUser(email:String?, password:String?)
    func loginSuccess()
    func showError(message: String)
}

protocol LoginWireFrameProtocol{
    var view: LoginViewProtocol? { get }
    func setUpView()
}

protocol LoginDataManagerProtocol{
    var interactor: LoginInteractorProtocol! { get set }
    func loginUser(email:String?, password:String?)
}
