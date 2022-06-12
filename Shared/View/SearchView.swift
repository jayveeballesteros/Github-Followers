//
//  SearchView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import SwiftUI

struct SearchView: View {
    
    @State var username: String = ""
    @State var showProfile: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                NavigationLink(destination: UserProfileView(username: $username), isActive: $showProfile) {
                    EmptyView()
                }
                
                Spacer()
                
                Image("github")
                    .resizable()
                    .frame(width: 130, height: 130, alignment: .center)
                
                Text("Followers")
                    .font(.title2)
                    .bold()
                
                TextField("Enter a username...", text: $username, onCommit: {
                    
                    self.showProfile.toggle()
                })
                .padding()
                .keyboardType(.webSearch)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .frame(maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 13.0).strokeBorder(Color(.systemGray2), style: StrokeStyle(lineWidth: 2.0)))
                .padding()
                
                
                
                Spacer()
                
                Button( action: {
                    showProfile.toggle()
                }) {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Search Profile")
                            .fontWeight(.bold)
                            .font(.title3)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(13)
                    .padding()
                }
                .disabled(self.username.isEmpty)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.light)
    }
}
