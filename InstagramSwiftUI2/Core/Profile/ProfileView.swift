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
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ProfileHeader(user: user)
                                    
                    ProfileSubheader(user: user)
                                    
                    IGWideButton("Edit Profile", style: .blackWhite) { }
                        .padding(.horizontal)
                                    
                    PostGridView(userPosts)
                    PostGridView(userPosts)

                    PostGridView(userPosts)
                    PostGridView(userPosts)

                    
                    Spacer()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS.first!)
    }
}

private struct ProfileStats: View {
    let name: String
    let amount: Int
    
    var body: some View {
        VStack {
            Text(String(amount))
                .bold()
            
            Text(name)
                .font(.callout)
        }
    }
}

private struct ProfileSubheader: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let fullname = user.fullname {
                Text(fullname).font(.headline)
            }
            
            if let bio = user.bio {
                Text(bio).font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

private struct ProfileHeader: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.profileImageUrl ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 88, height: 88)
                .clipShape(Circle())
            
            Spacer(minLength: 0)
            
            ProfileStats(name: "Posts", amount: 3)
            
            Spacer(minLength: 0)
            
            ProfileStats(name: "Followers", amount: 1)
            
            Spacer(minLength: 0)
            
            ProfileStats(name: "Following", amount: 2)
        }
        .padding(.horizontal)
    }
}
