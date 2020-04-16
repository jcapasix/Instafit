//
//  LoginRouter.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    fileprivate weak var view: LoginViewController?
    
    init(view: LoginViewController) {
        self.view = view
    }
    
    func routeToHome(with animate:Bool) {
        let homeViewController = HomeViewController()
        self.view?.navigationController?.pushViewController(homeViewController, animated: animate)
    }
}
