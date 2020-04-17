//
//  HomeRouter.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    fileprivate weak var view: HomeViewController?
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func routeToLogin(){
        AuthManager.shared.login = false
        self.view?.navigationController?.popToRootViewController(animated: true)
    }

}
