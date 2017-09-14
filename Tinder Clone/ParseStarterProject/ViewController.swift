/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse
import Bolts


class ViewController: UIViewController {
    
    var signUpMode = true
    
    var activityIndicator = UIActivityIndicatorView()

    @IBOutlet var emailText: UITextField!
    
    @IBOutlet var passwordText: UITextField!

    
    func createAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet var signupOrLogin: UIButton!
    
    
    @IBAction func signupOrLogin(_ sender: Any) {
        
        if (emailText.text?.isEmpty)! || (passwordText.text?.isEmpty)!{
            createAlert(title: "Error in form", message: "Pleae enter an email and password")
        } else {
            //print("emailText.text = " + emailText.text!)
           // print("passwordText.text = " + passwordText.text!)
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            if signUpMode {
                
                // Sign Up 
                
                let user = PFUser()
                
                user.username = emailText.text
                user.email = emailText.text
                user.password = passwordText.text
                
                user.signUpInBackground(block: { (success, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    // if there is an error
                    if error != nil {
                        
                        var displayErrorMessage = "Please try again later"
                        let error = error as NSError?
                        
                        if let errorMessage = error?.userInfo["error"] as? String {
                            displayErrorMessage = errorMessage
                        }
                        
                        self.createAlert(title: "Sign Up Error", message: displayErrorMessage)
                        
                    } else {
                        
                        print("user successfully signed up")
                        self.performSegue(withIdentifier: "goToUserInfo", sender: self)
                        
                    }
                    
                })
                
            } else {
                
                // Login Mode 
                
                PFUser.logInWithUsername(inBackground: emailText.text!, password: passwordText.text!, block: { (user, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error != nil {
                        
                        var displayErrorMessage = "Please try agian later."
                        
                        let error = error as NSError?
                        
                        if let errorMessage = error?.userInfo["error"] as? String {
                            displayErrorMessage = errorMessage
                            
                        }
                        self.createAlert(title: "Login Error", message: displayErrorMessage)
                        
                    } else {
                        print("Logged in")
                        self.performSegue(withIdentifier: "goToUserInfo", sender: self)
                    }
                    
                })
                
            }
            
        }
        
    }
    @IBOutlet var changeSignupModeButton: UIButton!
    
    @IBAction func changeSignupMode(_ sender: Any) {
        
        if signUpMode {
            // Change to login Mode 
            signupOrLogin.setTitle("Log in", for: [])
            changeSignupModeButton.setTitle("Sign Up", for: [])
            messageLabel.text = "Don't have an account?"
            signUpMode = false
        } else {
            // Change to signup Mode 
            signupOrLogin.setTitle("Sign Up", for: [])
            changeSignupModeButton.setTitle("Log In", for: [])
            messageLabel.text = "Already have an account?"
            signUpMode = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current() != nil {
            performSegue(withIdentifier: "goToUserInfo", sender: self)
        }
    }
    
    @IBOutlet var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
