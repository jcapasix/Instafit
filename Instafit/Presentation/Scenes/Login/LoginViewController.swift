//
//  LoginViewController.swift
//  Instafit
//
//  Created by Jordan Capa on 4/14/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: LoginPresenterProtocol!
    
    let usernameTextField: UITextField = UITextField()
    let passwordTextField: UITextField = UITextField()
    let loginButton: UIButton = UIButton(type: .system)
    let topContainerView: UIView = UIView()
    let loginContainerView: ShadowView = ShadowView()
    let titleLabel: UILabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        _ = LoginConfigurator.sharedInstance.configure(self)
        initView()
    }
    
    //MARK: - Own Methods
    
    private func initView(){
        
        print("initView")
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)

        usernameTextField.text = "jcapasix@gmail.com"
    }
    
    //MARK: - Actions
    
    @objc func loginButtonPressed() {
        presenter.loginUser(email: self.usernameTextField.text, password: self.passwordTextField.text)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}


extension LoginViewController: LoginViewProtocol{
    
    func showError(message: String){
        Utils.showError(viewController: self, title: "Error", message: "Todos los campos son requeridos.")
    }
}
