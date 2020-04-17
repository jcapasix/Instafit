//
//  HomeProtocol.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol! { get set }
    func showItems(items:[Item])
    func showError(message: String)
}

protocol HomePresenterProtocol: class {
    var router: HomeRouterProtocol { get }
    var interactor: HomeInteractorProtocol { get }
    func getItems()
    func showItems(items:[Item])
    func logout()
    func showError(message: String)
}

protocol HomeRouterProtocol {
    func routeToLogin()
}

protocol HomeConfiguratorProtocol {
    func configure(_ view: HomeViewProtocol)
}

protocol HomeInteractorProtocol{
    var presenter: HomePresenterProtocol! { get set }
    var dataManager: HomeDataManagerProtocol! { get set }

    func getItems()
    func showItems(items:[Item])
    func showError(message: String)
}

protocol HomeWireFrameProtocol{
    var view: HomeViewProtocol? { get }
    func setUpView()
}

protocol HomeDataManagerProtocol{
    var interactor: HomeInteractorProtocol! { get set }
    
    func getItems(_ completion: @escaping ((Result<ItemsResponse>) -> Void))
    func getItems(items:[Item])
}

