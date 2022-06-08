//
//  Follower.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import Foundation

struct Follower: Codable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

typealias Followers = [Follower]
