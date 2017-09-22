//
//  Comment.swift
//  Instagram
//
//  Created by Hien Le on 9/20/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import Foundation

class Comment {
    
    var commentText: String?
    var uid: String?
}

extension Comment {
    static func transformPostPhoto(dict: [String: Any]) -> Comment {
        let comment = Comment()
        
        comment.commentText = dict["commentText"] as? String
        comment.uid = dict["uid"] as? String
        
        return comment
    }
    
}
