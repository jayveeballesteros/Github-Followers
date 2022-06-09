//
//  ProfileWebView.swift
//  Github Followers
//
//  Created by Jayvee Ballesteros on 2022/06/09.
//

import Foundation
import SwiftUI
import WebKit

struct ProfileWebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> ProfileWebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
