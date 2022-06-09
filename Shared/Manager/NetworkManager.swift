//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var user = User(login: "", avatarURL: "", url: "", htmlURL: "", followersURL: "", followingURL: "", name: "", location: "", bio: "", twitterUsername: "", publicRepos: 0, publicGists: 0, followers: 0, following: 0)
    
    @Published var follower = [Follower]()

    let baseURL = "https://api.github.com/users/"
    
    func fetchUser(_ username: String) {
        guard let url = URL(string: baseURL + username) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self.user = user
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchFollower(_ username: String) {
        guard let url = URL(string: baseURL + username + "/followers") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let follower = try JSONDecoder().decode([Follower].self, from: data)
                DispatchQueue.main.async {
                    self.follower.append(contentsOf: follower)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
