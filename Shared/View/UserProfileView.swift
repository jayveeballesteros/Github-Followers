//
//  UserProfileView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.green)
            .opacity(0.5)
    }
}
extension Text {
    func buttonModifier() -> some View {
        self
            .fontWeight(.bold)
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
    }
}

extension View {
    func bgModifier() -> some View {
        self
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(13)
            .aspectRatio(contentMode: .fit)
    }
}



struct UserProfileView: View {
    class SheetManager: ObservableObject {
        enum Sheet {
            case WebGHProfile
            case FollowerSheet
        }
        
        @Published var showSheet = false
        @Published var whichSheet: Sheet? = nil
    }

    @StateObject var sheetManager = SheetManager()
    
    @StateObject var networkManager = NetworkManager()
    @Binding var username: String
    @State var searchedUser: String = ""

    
    var body: some View {
        
        
            VStack {
                
                VStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: networkManager.user.avatarURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                            switch phase {
                            case .success(let image):
                                image.imageModifier()
                                    .transition(.scale)
                            case .failure(_):
                                Image(systemName: "person.crop.circle.fill.badge.xmark").iconModifier()
                            case .empty:
                                Image(systemName: "person.crop.circle.fill").iconModifier()
                            @unknown default:
                                ProgressView()
                            }
                        }
                        VStack(alignment: .leading) {
                            Text(networkManager.user.login)
                                .font(.title)
                                .bold()
                            Text(networkManager.user.name)
                                .font(.subheadline)
                            HStack {
                                Image(systemName: "location.circle")
                                    .font(.subheadline)
                                Text(networkManager.user.location)
                                    .font(.subheadline)
                                
                            }
                        }
                        Spacer()
                    }
                    Text(networkManager.user.bio)
                        .foregroundColor(.gray)
                    
                    
                }
                .padding()
                .padding(.leading)
                
                
                VStack {
                    Spacer()
                    VStack {
                        VStack {
                            HStack {
                                HStack {
                                    Image(systemName: "folder.fill")
                                    Text("\(networkManager.user.publicRepos) Public Repos")
                                        .font(.subheadline)
                                }
                                .bgModifier()
                                
                                HStack {
                                    Image(systemName: "text.justify.left")
                                    Text("\(networkManager.user.publicGists) Public Gists")
                                        .font(.subheadline)
                                }
                                .bgModifier()
                                
                            }
                            
                            Button( action: {
                                sheetManager.whichSheet = .WebGHProfile
                                sheetManager.showSheet.toggle()
                            }) {
                                
                                Text("See Github Profile")
                                    .buttonModifier()
                                    .background(Color.purple)
                                    .cornerRadius(13)
                            }
                            .sheet(isPresented: $sheetManager.showSheet, content: {
                                if(sheetManager.whichSheet == .WebGHProfile) {
                                    GithubProfileView(url: networkManager.user.htmlURL)
                                }
                                
                                if(sheetManager.whichSheet == .FollowerSheet) {
                                    FollowerView(searchedUser: $username)
                                }
                            })
                        }
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(13)
                        .padding()
                        
                        
                    }
                }
                
                
                
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "person.3.fill")
                            Text("\(networkManager.user.followers) Followers")
                                .font(.subheadline)
                        }
                        .bgModifier()
                        
                        HStack {
                            Image(systemName: "person.3")
                            Text("\(networkManager.user.following) Following")
                                .font(.subheadline)
                        }
                        .bgModifier()
                        
                    }
                    
                    Button( action: {
                        sheetManager.whichSheet = .FollowerSheet
                        sheetManager.showSheet.toggle()
                    }) {
                        
                        Text("See Followers")
                            .buttonModifier()
                            .background(Color.green)
                            .cornerRadius(13)
                    }
                    .sheet(isPresented: $sheetManager.showSheet, content: {
                        if(sheetManager.whichSheet == .WebGHProfile) {
                            GithubProfileView(url: networkManager.user.htmlURL)
                        }
                        
                        if(sheetManager.whichSheet == .FollowerSheet) {
                            FollowerView(searchedUser: $username)
                        }
                    })
                }
                
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding()
                
                Spacer()
                
            }
            .onAppear {
                self.networkManager.fetchUser(username)
            }
        }
    
}

struct UserProfileView_Previews: PreviewProvider {
    
    @State static var username: String = ""
    
    static var previews: some View {
        UserProfileView(username: $username)
    }
}
