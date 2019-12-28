//
//  LoginViewController.swift
//  CIDemo
//
//  Created by Rahul Sharma on 29/12/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK:- IBOutlets -
    
    /// Login label
    @IBOutlet weak var loginLabel: UILabel!
    
    /// Enter E-mail Id label
    @IBOutlet weak var enterEmailLabel: UILabel!
    
    /// E-mail-Id Textfield
    @IBOutlet weak var emailTextField: UITextField!
    
    /// Enter Password label
    @IBOutlet weak var enterPasswordLabel: UILabel!
    
    /// Passoword textfield
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// Login Button 
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:- UIView Life Cycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up title
        title = "CIDemo"
        // Do any additional setup after loading the view.
    }
    
    
    /// Login button action
    /// - Parameter sender: Login button pressed
    @IBAction func loginButtonAction(_ sender: Any) {
        
    }
}
