//
//  FollowerView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import SwiftUI

struct FollowerView: View {
    
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject var networkManager = NetworkManager()
    @Binding var searchedUser: String
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(networkManager.followers, id: \.self) { follower in
                        VStack {
                            AsyncImage(url: URL(string: follower.avatarURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                                switch phase {
                                case .success(let image):
                                    image.imageModifier()
                                case .failure(_):
                                    Image(systemName: "person.crop.circle.fill.badge.xmark").iconModifier()
                                case .empty:
                                    Image(systemName: "person.crop.circle.fill").iconModifier()
                                @unknown default:
                                    ProgressView()
                                }
                                
                                
                                Text(follower.login)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                            }
                        }
                        .padding(10)
                        .background(Color(.systemGray5))
                        .cornerRadius(13)
                    }
                    if networkManager.followersListFull == false {
                        ProgressView()
                            .onAppear {
                                networkManager.fetchFollowers(for: searchedUser)
                            }
                    }
                }
                
            }
            .padding()
            
            .navigationBarTitle(Text("\(searchedUser)'s Followers"), displayMode: .inline)
        }
    }
}

struct FollowerView_Previews: PreviewProvider {
    
    @State static var searchedUser: String = ""
    
    static var previews: some View {
        FollowerView(searchedUser: $searchedUser)
    }
}
