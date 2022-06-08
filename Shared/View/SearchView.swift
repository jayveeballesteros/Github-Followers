//
//  SearchView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/08.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        VStack {
            Spacer()
            
            Image("github")
                .resizable()
                .frame(width: 130, height: 130, alignment: .center)
            
            Text("Followers")
                .font(.title2)
                .bold()
            
            TextField("Enter username...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 13.0).strokeBorder(.secondary, style: StrokeStyle(lineWidth: 2.0)))
                .padding()

            
            Spacer()
            
            Button( action: {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }) {
                
                Text("See Profile")
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(13)
                    .foregroundColor(.white)
                    .padding()
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
