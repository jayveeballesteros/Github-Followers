//
//  GithubProfileView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/09.
//

import SwiftUI

struct GithubProfileView: View {
    
    
    let url: String?
    
    var body: some View {
        ProfileWebView(urlString: url)
    }
       
}

struct GithubProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GithubProfileView(url: "https://www.github.com")
    }
}
