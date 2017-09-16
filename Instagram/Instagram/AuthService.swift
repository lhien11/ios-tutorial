//
//  AuthService.swift
//  Instagram
//
//  Created by Hien Le on 9/16/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class AuthService {
    
    // Class method or type method
    static func signIn(email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            // print(user?.email)
            onSuccess()
        })
        
    }
    
    static func signUp(username: String, email: String, password: String, imageData: Data, onSuccess: @escaping() -> Void, onError: @escaping (_ errorMessage: String?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password, completion:  { (user, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let uid = user?.uid
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("profile_image").child(uid!)
            storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    return
                }
                let profileImageUrl = metadata?.downloadURL()?.absoluteString
                
                self.setUserInformation(profileImageUrl: profileImageUrl!, username: username, email: email, uid: uid!, onSuccess: onSuccess)
                
            })
        })
        
    }
    
    static func setUserInformation(profileImageUrl: String, username: String, email: String, uid: String,  onSuccess: @escaping() -> Void){
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        //print(ref.description())
        let usersReference = ref.child("users")
        //print(usersReference.description())
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["username": username, "email": email, "profileImageUrl": profileImageUrl])
        // print(" description: \(newUserReference.description())")
        // self.performSegue(withIdentifier: "signUpToTabbarVc", sender: nil)
        onSuccess()
    }
    
}
