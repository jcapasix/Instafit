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
        

//        let topContainerView = viewController.topContainerView
//        let usernameTextField = viewController.usernameTextField
//        let passwordTextField = viewController.passwordTextField
//        let loginButton = viewController.loginButton
//        let titleLabel = viewController.titleLabel
//        let loginContainerView: ShadowView = viewController.loginContainerView
//
//
//        topContainerView.translatesAutoresizingMaskIntoConstraints = false
//        topContainerView.backgroundColor = Constants.colorAccent
//
//
//        titleLabel.text = "Login"
//        titleLabel.textColor = UIColor.white
//        titleLabel.textAlignment = .center
//        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        loginContainerView.shadowRadius = 5.0
//        loginContainerView.cornerRadius = 13.0
//        loginContainerView.translatesAutoresizingMaskIntoConstraints = false
//        loginContainerView.backgroundColor = .white
//
//        usernameTextField.backgroundColor = .white
//        usernameTextField.borderStyle = .roundedRect
//        usernameTextField.placeholder = "Email"
//        usernameTextField.textColor = Constants.colorAccent
//        usernameTextField.setIcon(UIImage(named: "email-ico")!)
//        usernameTextField.keyboardType = .emailAddress
//        usernameTextField.autocapitalizationType = .none
//        usernameTextField.font = UIFont.boldSystemFont(ofSize: 16)
//        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
//
//
//        passwordTextField.backgroundColor = .white
//        passwordTextField.borderStyle = .roundedRect
//        passwordTextField.placeholder = "Password"
//        passwordTextField.textColor = Constants.colorAccent
//        passwordTextField.setIcon(UIImage(named: "password-ico")!)
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.font = UIFont.boldSystemFont(ofSize: 16)
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//
//
//        loginButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        loginButton.setTitle("Login", for: .normal)
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        loginButton.setTitleColor(.white, for: .normal)
//        loginButton.backgroundColor = Constants.colorAccent
//        loginButton.layer.masksToBounds = true
//        loginButton.layer.cornerRadius = Constants.controlHeight / 2.0
//        loginButton.layer.shadowColor = Constants.colorAccent.cgColor
//        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
//        loginButton.layer.shadowOpacity = 0.8
//        loginButton.layer.shadowRadius = 5.0
//        loginButton.layer.masksToBounds = false
//
//
//        topContainerView.addSubview(titleLabel)
//        viewController.view.addSubview(topContainerView)
//        (view as? LoginViewController)?.view.addSubview(loginContainerView)
//
//        loginContainerView.addSubview(usernameTextField)
//        loginContainerView.addSubview(passwordTextField)
//        loginContainerView.addSubview(loginButton)
//
//
//
//        NSLayoutConstraint.activate([
//            topContainerView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
//            topContainerView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor),
//            topContainerView.rightAnchor.constraint(equalTo: viewController.view.rightAnchor),
//            topContainerView.heightAnchor.constraint(equalTo: viewController.view.heightAnchor, multiplier: 0.35),
//
//            titleLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 100.0),
//            titleLabel.widthAnchor.constraint(equalTo: topContainerView.widthAnchor),
//
//
//            loginContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40.0),
//            loginContainerView.widthAnchor.constraint(equalTo: viewController.view.widthAnchor, multiplier: 0.85),
//            loginContainerView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
//            loginContainerView.heightAnchor.constraint(equalTo: viewController.view.heightAnchor, multiplier: 0.50),
//
//            usernameTextField.topAnchor.constraint(equalTo: loginContainerView.topAnchor, constant: 40.0),
//            usernameTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor, multiplier: 0.85),
//            usernameTextField.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
//            usernameTextField.heightAnchor.constraint(equalToConstant: Constants.controlHeight),
//
//            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30.0),
//            passwordTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor, multiplier: 0.85),
//            passwordTextField.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
//            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.controlHeight),
//
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40.0),
//            loginButton.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor, multiplier: 0.85),
//            loginButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
//            loginButton.heightAnchor.constraint(equalToConstant: Constants.controlHeight)
//
//        ])
        
//        addSubViews(views: usernameTextField, passwordTextField, loginButton)
    }
    
    func addSubViews(views: UIView...){
//        for (index, view) in views.enumerated(){
////            let key = "v\(index)"
//            view.translatesAutoresizingMaskIntoConstraints = false
////            (view as? LoginViewController)?.view.
////            viewsDictionary[key] = view
//        }
    }
    
}

