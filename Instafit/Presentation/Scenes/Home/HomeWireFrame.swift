//
//  HomeWireFrame.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    var view: HomeViewProtocol?
    
    func setUpView(){
        
        guard let viewController = (view as? HomeViewController) else{
            return
        }
        
        viewController.view.backgroundColor = .white
        viewController.navigationController?.navigationBar.isHidden = false
        viewController.navigationController?.navigationBar.isTranslucent = false
        viewController.navigationItem.setHidesBackButton(true, animated: true)
        viewController.navigationController?.navigationBar.barTintColor = Constants.colorAccent
        viewController.navigationController?.navigationBar.tintColor = UIColor.white
        viewController.title = "Items"
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        viewController.navigationController?.navigationBar.titleTextAttributes = textAttributes
    
    }
    
    
}

