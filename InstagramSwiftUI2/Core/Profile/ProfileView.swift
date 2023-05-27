//
//  ProfileView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appManager: AppManager
    @StateObject private var viewModel: ProfileViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Spacer(minLength: 0)
                
                ProfileHeader(user: viewModel.user, postsCount: viewModel.posts.count)
                
                ProfileSubheader(user: viewModel.user)
                
                IGWideButton(
                    isCurrentUser: viewModel.user.isCurrentUser
                ) {
                    if viewModel.user.isCurrentUser {
                        viewModel.presentingEditProfile.toggle()
                    } else {
                        
                    }
                }
                .padding(.horizontal)
                
                PostsGridView(viewModel.posts)
                
                Spacer()
            }
        }
        .navigationTitle(
            if: appManager.selectedTab == .profile,
            title: "My Profile"
        )
        .fullScreenCover(isPresented: $viewModel.presentingEditProfile) {
            EditProfileView(viewModel.user)
        }
        .animation(.spring(), value: viewModel.posts)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(user: User.MOCK_USERS.first!)
                .environmentObject(AppManager())
        }
    }
}
