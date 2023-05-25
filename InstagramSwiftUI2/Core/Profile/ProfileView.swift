//
//  ProfileView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    private var userPosts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ProfileHeader(user: user)
                
                ProfileSubheader(user: user)
                
                IGWideButton(
                    "Edit Profile",
                    style: .blackWhite
                ) {
                    
                }
                .padding(.horizontal)
                
                PostsGridView(userPosts)
                
                Spacer()
            }
        }
        .padding(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS.first!)
    }
}
