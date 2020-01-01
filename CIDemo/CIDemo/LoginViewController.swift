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
    
    /// Enter E-mail ID label
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
        // Add tap gesture recognizer to dimissKeyboard
        addTapGestureRecognizer()
    }
    
    
    /// Login button action
    /// - Parameter sender: Login button pressed
    @IBAction func loginButtonAction(_ sender: Any? = nil) {
        print("Login Button Pressed")
        dismissKeyboard()
        verifyEmailAndPassword()
    }
}

extension LoginViewController: UIGestureRecognizerDelegate {
    func addTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField         : verifyEmail()
        case passwordTextField      : verifyPassword()
        default                     : break
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case emailTextField         : verifyEmail()
        case passwordTextField      : verifyPassword()
        default                     : break
        }
    }
}

extension LoginViewController {
    func verifyEmail() {
        if let email = emailTextField.text {
            if email.isValidEmail() {
                passwordTextField.becomeFirstResponder()
            } else if email.count > 0 {
                displayAlert("Alert", with: "Please enter valid E-mail ID")
            }
        }
    }
    
    func verifyPassword() {
        if let password = passwordTextField.text {
            if password.isValidPassword() {
                loginButtonAction()
            } else if password.count > 0 {
                displayAlert("Alert", with: getErrorMessageFor(password))
            }
        }
    }
    
    func getErrorMessageFor(_ password: String) -> String {
        var messageArray = [String]()
        if password.count > 0 {
            if (password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil) {
                messageArray.append("one upper case letter")
            }
            if (password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil) {
                messageArray.append("one lower case letter")
            }
            if (password.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                messageArray.append("one number")
            }
            if password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
                messageArray.append("one specail character")
            }
            if password.count < 7 {
                messageArray.append("seven characters")
            }
            let message = "Password requires at least "
            if messageArray.count == 1 {
                return message + (messageArray.first ?? "")
            } else if messageArray.count > 1 {
                return message + Array(messageArray[0...messageArray.count - 2]).joined(separator: ", ") + " and " + (messageArray.last ?? "")
            } else {
                return message
            }
        }
        return ""
    }
    
    func displayAlert(_ title: String? = nil, with message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.accessibilityIdentifier = "LVCAlertView"
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func verifyEmailAndPassword() {
        if let email = emailTextField.text, !email.isValidEmail() {
            displayAlert("Alert", with: "Please enter valid E-mail ID")
        } else if let password = passwordTextField.text, !password.isValidPassword() {
            displayAlert("Alert", with: getErrorMessageFor(password))
        } else {
            displayAlert("Message", with: "Login Successful!!!")
        }
    }
}
