//
//  HomeConfigurator.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

class HomeConfigurator{
    
    // MARK: Object lifecycle
    public static let sharedInstance = HomeConfigurator()
    
    // MARK: Configuration
    
    func configure(_ view: HomeViewProtocol) {
        
        let dataManager = HomeDataManager(apiClient: APIClient())
        let interactor = HomeInteractor()
        let wireFrame = HomeWireFrame()
        
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        wireFrame.view = view
        
        let router = HomeRouter(view: view as! HomeViewController)
        let presenter = HomePresenter(view: view, router: router, interactor: interactor, wireFrame: wireFrame)
        
        interactor.presenter = presenter
        view.presenter = presenter
    }
}
