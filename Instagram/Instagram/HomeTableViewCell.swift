//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Hien Le on 9/19/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

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
    
    func updateView(){
        captionLabel.text = post?.caption
        profileImageView.image = UIImage(named: "photo1.jpeg")
        nameLabel.text = "Steve"
        if let photoUrlString = post?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            postImageView.sd_setImage(with: photoUrl)
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
