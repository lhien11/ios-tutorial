//
//  SignInViewController.swift
//  Instagram
//
//  Created by Hien Le on 9/14/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit
import FirebaseAuth 

class SignInViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
 
    @IBOutlet var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.tintColor = UIColor.white
        emailTextField.textColor = UIColor.white
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor(white: 1.0, alpha: 0.6)])
        
        let bottomLayerEmail = CALayer()
        bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor(red: 50/256, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextField.layer.addSublayer(bottomLayerEmail)
        
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor(white: 1.0, alpha: 0.6)])
        
        let bottomLayerPassword = CALayer()
        bottomLayerPassword.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor(red: 50/256, green: 50/255, blue: 25/255, alpha: 1).cgColor
        passwordTextField.layer.addSublayer(bottomLayerPassword)
        
        handleEmailAndPasswordValidation()
        
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (Auth.auth().currentUser) != nil {
            self.performSegue(withIdentifier: "signInToTabbarVc", sender: nil)
        }
        

    }
    
    func handleEmailAndPasswordValidation() {
        emailTextField.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        passwordTextField.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    
    func textFieldDidChange() {
        
        // A guard statement is used to transfer program control out of a scope if one or more conditions aren’t met.
        
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            
            signInButton.setTitleColor(UIColor.lightText, for: UIControlState.normal)
            signInButton.isEnabled = false
            return
            
        }
        signInButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signInButton.isEnabled = true
        
    }

    @IBAction func signInButton_TouchUpInside(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                print("Error: " + error!.localizedDescription)
                return
            }
           // print(user?.email)
            self.performSegue(withIdentifier: "signInToTabbarVc", sender: nil)
        }
        
        
    }


}
