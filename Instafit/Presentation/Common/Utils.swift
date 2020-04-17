//
//  Utils.swift
//  Instafit
//
//  Created by Jordan Capa on 4/15/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    
    static func showError(viewController: UIViewController, title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlert(viewController: UIViewController, title:String, message:String, completion: @escaping (() -> Void)){
        
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (action) in
            completion()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        viewController.present(alert, animated: true)
    }
    
    static func getRandomHeight() -> CGFloat{
        let heights:[CGFloat] = [320.0, 213.5]
        return heights.randomElement() ?? 0.0
    }

    
}
