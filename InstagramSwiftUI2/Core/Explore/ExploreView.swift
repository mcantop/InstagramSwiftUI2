//
//  SearchView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var appManager: AppManager
    @EnvironmentObject var viewModel: ExploreViewModel
    @State private var searchQuery = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.users) { user in
                    UserCell(user, showFullName: true)
                }
            }
            .padding(.top)
        }
        .searchable(
            if: appManager.selectedTab == .explore,
            text: $searchQuery,
            prompt: "Search for users..."
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(AppManager())
    }
}
