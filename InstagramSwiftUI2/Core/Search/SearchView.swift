//
//  SearchView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack {
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
            .searchable(text: $searchQuery)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
