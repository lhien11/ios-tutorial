//
//  UserDetailsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Hien Le on 9/13/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class UserDetailsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var userImage: UIImageView!
    
    @IBAction func updateProfileImage(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImage.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet var genderSwitch: UISwitch!
    
    @IBOutlet var interestSwitch: UISwitch!
    
    
    @IBOutlet var errorLabel: UILabel!
    
    @IBAction func update(_ sender: Any) {
        
        PFUser.current()?["isFemale"] = genderSwitch.isOn
        PFUser.current()?["isInterestedInWomen"] = interestSwitch.isOn
        
//        let imageData = UIImagePNGRepresentation(userImage.image!)
        let imageData = UIImageJPEGRepresentation(userImage.image!, 0.5)

        
        PFUser.current()?["photo"] = PFFile(name: "profile.jpg", data: imageData!) // !! This line causes a runtime error
        
        PFUser.current()?.saveInBackground(block: { (success, error) in
            if error != nil {
                
                var errorMessage = "Update failed - please try again"
                let error = error as NSError?
                if let parseError = error?.userInfo["error"] as? String {
                    errorMessage = parseError
                }
                self.errorLabel.text = errorMessage
                
            } else {
                print("Updated")
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        
        if let isFemale = PFUser.current()?["isFemale"] as? Bool {
            genderSwitch.setOn(isFemale, animated: false)
        }
        
        if let interestedIn = PFUser.current()?["isInterestedInWomen"] as? Bool {
            interestSwitch.setOn(interestedIn, animated: false)
        }
        
        if let photo = PFUser.current()?["photo"] as? PFFile {
            photo.getDataInBackground(block: { (data, error) in
                if let imageData = data {
                    if let downloadedImage = UIImage(data: imageData) {
                        self.userImage.image = downloadedImage
                    }
                }
            })
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
