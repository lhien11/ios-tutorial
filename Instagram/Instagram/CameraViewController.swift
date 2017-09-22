//
//  CameraViewController.swift
//  Instagram
//
//  Created by Hien Le on 9/14/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class CameraViewController: UIViewController {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var captionTextView: UITextView!
    
    @IBOutlet var cancleButton: UIBarButtonItem!
    @IBOutlet var shareButton: UIButton!
    var selectedImage: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        handlePostImage()
    }
    
    func handlePostImage(){
        if selectedImage != nil {
            self.shareButton.isEnabled = true
            self.shareButton.backgroundColor = .green
            self.cancleButton.isEnabled = true
            self.cancleButton.tintColor = .green
        } else {
            self.shareButton.isEnabled = false
            self.shareButton.backgroundColor = .red
            self.cancleButton.isEnabled = false
            self.cancleButton.tintColor = .red

            
        }
    }
    @IBAction func cancle_TouchUpInside(_ sender: Any) {

        clean()
        handlePostImage()
    }
    
    @IBAction func shareButton_TouchUpInside(_ sender: Any) {
        view.endEditing(true)
        ProgressHUD.show("Waiting ...", interaction: false)
        if let profileImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(profileImg, 0.1){
            let photoIdString = NSUUID().uuidString
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("posts").child(photoIdString)
            storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    return
                }
                let photoUrl = metadata?.downloadURL()?.absoluteString
                self.sendDataToDatabase(photoUrl: photoUrl!)
            })
        } else {
            ProgressHUD.showError("Profile Image can't be empty")
        }
        
    }
    
    func sendDataToDatabase(photoUrl: String) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let postsReference = ref.child("posts")
        let newPostId = postsReference.childByAutoId().key
        let newPostReference = postsReference.child(newPostId)
        guard let currentUser = Auth.auth().currentUser else  {
            return
        }
        let currentUserId = currentUser.uid
        
        
        
        newPostReference.setValue(["uid": currentUserId, "photoUrl": photoUrl, "caption": captionTextView.text!]) { (error, ref) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            ProgressHUD.showSuccess("Successfully uploaded the data")
            self.clean()
            self.tabBarController?.selectedIndex = 0
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectedPhoto))
        photo.addGestureRecognizer(tapGesture)
        photo.isUserInteractionEnabled = true
        
    }
    
    func handleSelectedPhoto() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    func clean() {
        self.captionTextView.text = ""
        self.photo.image = UIImage(named: "placeholder-photo")
        self.selectedImage = nil
        self.cancleButton.isEnabled = false
        self.cancleButton.tintColor = .red
    
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       // print("did Finish Picking Media")

        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = image
            photo.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
