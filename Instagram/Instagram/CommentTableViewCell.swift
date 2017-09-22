//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by Hien Le on 9/20/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.text = ""
        commentLabel.text = ""
    }
    
    var comment: Comment? {
        didSet {
            updateView()
        }
    }
    
    var users: User? {
        didSet {
            setupUserInfo()
        }
    }
    
    func updateView(){
        commentLabel.text = comment?.commentText
    }
    
    func setupUserInfo() {
        nameLabel.text = users?.username
        if let photoUrlString = users?.profileImageUrl {
            let photoUrl = URL(string: photoUrlString)
            profileImageView.sd_setImage(with: photoUrl, placeholderImage: UIImage(named: "placeholderImg"))
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = UIImage(named: "placeholderImg")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
