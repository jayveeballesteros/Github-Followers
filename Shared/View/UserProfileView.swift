//
//  UserProfileView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import SwiftUI

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
    var body: some View {
        
        
        VStack {
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("jayveeballesteros")
                            .font(.title)
                            .bold()
                        Text("Jayvee Ballesteros")
                            .font(.subheadline)
                        HStack {
                            Image(systemName: "location.circle")
                                .font(.subheadline)
                            Text("Tokyo, Japan")
                                .font(.subheadline)
                            
                        }
                    }
                    Spacer()
                }
                Text("Aspiring iOS Developer")
                
            }
            .padding()
            .padding(.leading)
               
            VStack {
                VStack {
                    VStack {
                        HStack {
                            HStack {
                                Image(systemName: "folder.fill")
                                Text("8 Public Repos")
                                    .font(.subheadline)
                            }
                            .bgModifier()
                            
                            HStack {
                                Image(systemName: "text.justify.left")
                                Text("0 Public Gists")
                                    .font(.subheadline)
                            }
                            .bgModifier()
                            
                        }

                        Button( action: {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }) {
                            
                            Text("See Github Profile")
                                .buttonModifier()
                                .background(Color.purple)
                                .cornerRadius(13)                
                        }
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
                        Text("8 Followers")
                            .font(.subheadline)
                    }
                    .bgModifier()
                    
                    HStack {
                        Image(systemName: "person.3")
                        Text("0 Following")
                            .font(.subheadline)
                    }
                    .bgModifier()
                    
                }
                
                Button( action: {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }) {
                    
                    Text("See Followers")
                        .buttonModifier()
                        .background(Color.green)
                        .cornerRadius(13)
                }
            }
            
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(13)
            .padding()
            
            Spacer()
            
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
