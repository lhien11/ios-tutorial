//
//  User.swift
//  Instagram
//
//  Created by Hien Le on 9/19/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import Foundation

class User {
    var email: String?
    var profileImageUrl: String?
    var username: String?
}

extension User {
    static func transformUser(dict: [String: Any]) -> User {
        let user = User()
        user.email = dict["email"] as? String
        user.profileImageUrl = dict["profileImageUrl"] as? String
        user.username = dict["username"] as? String
        
        return user
    }
}
