//
//  MainTabView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Image(systemName: "house") }
            
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
            
            Text("Upload")
                .tabItem { Image(systemName: "plus.square") }
            
            Text("Notifications")
                .tabItem { Image(systemName: "heart") }
            
            NavigationStack {
                ProfileView(user: User.MOCK_USERS.first!)
            }
            .tabItem { Image(systemName: "person") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
