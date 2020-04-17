//
//  HomeInteractor.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {

    var dataManager: HomeDataManagerProtocol!
    var presenter: HomePresenterProtocol!
    
    func getItems() {
        dataManager.getItems { (result) in
            switch result {
            case .success(let itemsResponse):
//                self.showItems(items: itemsResponse.data)
                self.dataManager.getItems(items: itemsResponse.data)
            case .failure( _):
                self.dataManager.getItems(items: [])
//                self.presenter.showError(message: "Error al llamar al servicio.")
            }
        }
    }
    
    func showItems(items:[Item]){
        self.presenter.showItems(items: items)
        
//        _ = UserDefaults.standard
        
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(items) {
//            let defaults = UserDefaults.standard
//            defaults.set(encoded, forKey: "items")
//        }
        
//        let defaults = UserDefaults.standard
//        
//        if let savedPerson = defaults.object(forKey: "items") as? Data {
//            let decoder = JSONDecoder()
//            if let loadedPerson = try? decoder.decode([Item.self], from: savedPerson) {
//                print(loadedPerson.name)
//            }
//        }
    }
    
    func showError(message: String){
        self.presenter.showError(message: message)
    }
    
}
