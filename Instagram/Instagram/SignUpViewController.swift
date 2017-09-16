//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Hien Le on 9/14/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var profileImage: UIImageView!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.backgroundColor = UIColor.clear
        usernameTextField.tintColor = UIColor.white
        usernameTextField.textColor = UIColor.white
        usernameTextField.attributedPlaceholder = NSAttributedString(string: usernameTextField.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor(white: 1.0, alpha: 0.6)])
        
        let bottomLayerUsername = CALayer()
        bottomLayerUsername.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerUsername.backgroundColor = UIColor(red: 50/256, green: 50/255, blue: 25/255, alpha: 1).cgColor
        usernameTextField.layer.addSublayer(bottomLayerUsername)
        

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
        
        profileImage.layer.cornerRadius = 40
        profileImage.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleSelectedProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        
        handleEmailAndPasswordValidation()
    }
    
    func handleEmailAndPasswordValidation() {
        usernameTextField.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        emailTextField.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        passwordTextField.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    func textFieldDidChange() {
        
        // A guard statement is used to transfer program control out of a scope if one or more conditions aren’t met.
        
        guard let username = usernameTextField.text, !username.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            
            signUpButton.setTitleColor(UIColor.lightText, for: UIControlState.normal)
            signUpButton.isEnabled = false
            return

        }
        signUpButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signUpButton.isEnabled = true
        
    }
    
    func handleSelectedProfileImageView() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
        
    }
    @IBAction func signUpBtn_TouchUpInside(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let uid = user?.uid
            let storageRef = Storage.storage().reference(forURL: "gs://instagramclone-6b003.appspot.com").child("profile_image").child(uid!)
            if let profileImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(profileImg, 0.1){
                storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        return
                    }
                    let profileImageUrl = metadata?.downloadURL()?.absoluteString

                    self.setUserInformation(profileImageUrl: profileImageUrl!, username: self.usernameTextField.text!, email: self.emailTextField.text!, uid: uid!)
                    
                })
            }
            
    
        }
    }
    
    func setUserInformation(profileImageUrl: String, username: String, email: String, uid: String){
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        //print(ref.description())
        let usersReference = ref.child("users")
        //print(usersReference.description())
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["username": username, "email": email, "profileImageUrl": profileImageUrl])
        // print(" description: \(newUserReference.description())")
        self.performSegue(withIdentifier: "signUpToTabbarVc", sender: nil)
        
    }

}



extension SignUpViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = image
            profileImage.image = image
        }
       // print(info)
       // profileImage.image = infoPhoto
        dismiss(animated: true, completion: nil)
    }
}
