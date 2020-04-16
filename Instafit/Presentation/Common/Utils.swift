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
    
}
