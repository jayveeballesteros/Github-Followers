//
//  User.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarURL, url, htmlURL, followersURL: String
    let followingURL, name, location, bio: String
    let twitterUsername: String
    let publicRepos, publicGists, followers, following: Int

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case name, location, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
    }
}
