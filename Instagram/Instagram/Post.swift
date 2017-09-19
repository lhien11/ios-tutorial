//
//  Post.swift
//  Instagram
//
//  Created by Hien Le on 9/18/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import Foundation

import Foundation
class Post {
    var caption: String?
    var photoUrl: String?
    var uid: String? 
}

extension Post {
    static func transformPostPhoto(dict: [String: Any]) -> Post {
        let post = Post()
        
        post.caption = dict["caption"] as? String
        post.photoUrl = dict["photoUrl"] as? String
        post.uid = dict["uid"] as? String

        return post
    }
    
    static func transformPostVideo() {
        
    }
}
