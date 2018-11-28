//
//  ProfileFriendsDataSource.swift
//  ProfileDemo
//
//  Created by Alberto Huerdo on 11/27/18.
//  Copyright © 2018 huerdo. All rights reserved.
//

import Foundation

class ProfileFriendsDataSource {
    
    func getFriends() -> [User] {
        return [
            User(name: "Landon Clark",
                 username: "@landon",
                 followed: false,
                 photo:#imageLiteral(resourceName: "Profile Img_10") ),
            User(name: "Felix Hamilton",
                 username: "@felix",
                 followed: true,
                 photo:#imageLiteral(resourceName: "Profile Img_9") ),
            User(name: "Josh Ranger",
                 username: "@josh_24",
                 followed: false,
                 photo:#imageLiteral(resourceName: "Profile Img_8") ),
            User(name: "Niki McDuffie",
                 username: "@Duffie",
                 followed: false,
                 photo:#imageLiteral(resourceName: "Profile Img_7") ),
            User(name: "Elisa Finch",
                 username: "@efinch",
                 followed: false,
                 photo:#imageLiteral(resourceName: "Profile Img_6") )
        ]
    }
    
}
