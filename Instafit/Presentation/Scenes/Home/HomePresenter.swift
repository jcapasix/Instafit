//
//  HomePresenter.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

class HomePresenter {
    
    fileprivate weak var view: HomeViewProtocol?
    internal let router: HomeRouterProtocol
    internal let interactor: HomeInteractorProtocol
    internal let wireFrame: HomeWireFrameProtocol
        
    init(view: HomeViewProtocol, router: HomeRouterProtocol, interactor: HomeInteractorProtocol, wireFrame: HomeWireFrameProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.wireFrame.setUpView()
    }
    
}

extension HomePresenter: HomePresenterProtocol{
    
    func getItems() {
        NetworkManager.isReachable { networkManagerInstance in
            self.interactor.getItems()
        }
        
        NetworkManager.isUnreachable { networkManagerInstance in
            self.view?.showError(message: "No hay conexión a internet.")
            self.interactor.getItems()
        }
    }
    
    func showItems(items:[Item]){
        self.view?.showItems(items: items)
    }
    
    func showItemDetail(item: Item){
        self.router.routeToItemDetail(item: item)
    }
    
    func logout(){
        router.routeToLogin()
    }
    
    func showError(message: String){
        Loading.shared.stopAnimating {
            self.view?.showError(message: message)
        }
    }
}
