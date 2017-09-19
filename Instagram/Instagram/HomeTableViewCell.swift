//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Hien Le on 9/19/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeImageview: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var likeCountButton: UIButton!
    
    @IBOutlet weak var shareImageView: NSLayoutConstraint!
    
    var post: Post? {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        captionLabel.text = post?.caption
        if let photoUrlString = post?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            postImageView.sd_setImage(with: photoUrl)
        }
        print(" i am in the updateView in HomeTableViewCell")
        setupUserInfo()
    }
    
    func setupUserInfo() {
        print(" I am in the setupuser info")
        print("post?.uid = \(post?.uid)")
        if let uid = post?.uid {
            print( " did i get here")
            Database.database().reference().child("users").child(uid).observeSingleEvent(of: DataEventType.value, with: {
                snapshot in
                if let dict = snapshot.value as? [String: Any] {
                    print("i am in the setupUserInfo")
                    let user = User.transformUser(dict: dict)
                    self.nameLabel.text = user.username
                    if let photoUrlString = user.profileImageUrl {
                        let photoUrl = URL(string: photoUrlString)
                        self.profileImageView.sd_setImage(with: photoUrl)
                    }
                }
                
            })
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
