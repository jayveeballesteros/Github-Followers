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
                    ForEach(networkManager.follower, id: \.self) { follower in
                        VStack {
                            AsyncImage(url: URL(string: follower.avatarURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(13)
                                case .failure(_):
                                    Image(systemName: "ant.circle.fill").iconModifier()
                                case .empty:
                                    Image(systemName: "photo.circle.fill").iconModifier()
                                    
                                @unknown default:
                                    ProgressView()
                                }
                                
                                
                                Text(follower.login)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                        .padding(10)
                        .background(Color(.systemGray4))
                        .cornerRadius(13)
                    }
                }
            }
            .padding()
            .onAppear {
                networkManager.fetchFollower(searchedUser)
            }
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
