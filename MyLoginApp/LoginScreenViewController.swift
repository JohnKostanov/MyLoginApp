//
//  LoginScreenViewController.swift
//  MyLoginApp
//
//  Created by  Джон Костанов on 29/06/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    let userName = "KostanovJohn"
    let password = "30101986"

    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    

    
        @IBAction func forgotUNButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ваш User Name", message: "KostanovJohn", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ваш Password", message: "30101986", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
                if userNameTextField.text == userName && passwordTextField.text == password {
                    performSegue(withIdentifier: "LogInSegue", sender: nil)
                    
        
                } else {
                    let alert = UIAlertController(title: "Ошибка!", message: "UserName или Password введен неправильно", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "LogInSegue" else { return }
        segue.destination.navigationItem.title = userNameTextField.text
    }
    
    @IBAction func myUnwindFunction(_ segue: UIStoryboardSegue) {
        
    }
    
}

extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
            return true
        } else {
            textField.resignFirstResponder()
            return true
        }
    }
}

