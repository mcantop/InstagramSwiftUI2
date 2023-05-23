//
//  SearchView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var appManager: AppManager
    @State private var searchQuery = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(User.MOCK_USERS) { user in
                    NavigationLink(value: user) {
                        UserCell(user, showFullName: true)
                    }
                }
            }
            .padding(.top)
        }
        .searchable(
            if: appManager.selectedTab == .explore,
            text: $searchQuery,
            prompt: "Search for users..."
        )
        .navigationDestination(for: User.self) { user in
            ProfileView(user: user)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(AppManager())
    }
}
