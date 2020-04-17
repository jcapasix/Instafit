//
//  Loading.swift
//  Instafit
//
//  Created by Jordan Capa on 4/15/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

class Loading{
    
    static let shared = Loading()
    
    let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    init(){
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
    }
    
    func startAnimating(view: UIViewController){
        alert.view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
        view.present(alert, animated: true, completion: nil)
    }
    
    func stopAnimating(with completion: @escaping (() -> Void)){
        DispatchQueue.main.async {
            self.alert.dismiss(animated: true, completion: {
                self.loadingIndicator.stopAnimating()
                completion()
            })
        }
    }
    
    func stopAnimating(){
        alert.dismiss(animated: true, completion:nil)
        self.loadingIndicator.stopAnimating()
    }
}
