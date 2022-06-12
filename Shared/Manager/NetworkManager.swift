//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    @Published var user = User(login: "", avatarURL: "", url: "", htmlURL: "", followersURL: "", followingURL: "", name: "", location: "", bio: "", publicRepos: 0, publicGists: 0, followers: 0, following: 0)
    
    @Published var followers = [Follower]()
    
    // Tells if all records have been loaded. (Used to hide/show activity spinner)
    var followersListFull = false
    // Tracks last page loaded. Used to load next page (current + 1)
    var currentPage = 0
    // Limit of records per page. (Only if backend supports, it usually does)
    let perPage = 50
    
    let baseURL = "https://api.github.com/users/"
    
    func fetchFollowers(for username: String) {
        guard let url = URL(string: baseURL + username + "/followers?per_page=\(perPage)&page=\(currentPage + 1)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let followers = try JSONDecoder().decode([Follower].self, from: data)
                DispatchQueue.main.async {
                    self.followers.append(contentsOf: followers)
                    self.currentPage += 1
                    // If count of data received is less than perPage value then it is last page.
                    if followers.count < self.perPage {
                        self.followersListFull = true
                        print("LESS")
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
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
    
    
    
}
