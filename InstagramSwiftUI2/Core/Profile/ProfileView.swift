//
//  ProfileView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appManager: AppManager
    @State private var presentingEditProfile = false
    let user: User

    private var userPosts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Spacer(minLength: 0)
                
                ProfileHeader(user: user)
                
                ProfileSubheader(user: user)
                
                IGWideButton(
                    isCurrentUser: user.isCurrentUser
                ) {
                    if user.isCurrentUser {
                        presentingEditProfile.toggle()
                    } else {
                        
                    }
                }
                .padding(.horizontal)
                
                PostsGridView(userPosts)
                
                Spacer()
            }
        }
        .navigationTitle(
            if: appManager.selectedTab == .profile,
            title: "My Profile"
        )
        .fullScreenCover(isPresented: $presentingEditProfile) {
            EditProfileView(user)
        }
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
