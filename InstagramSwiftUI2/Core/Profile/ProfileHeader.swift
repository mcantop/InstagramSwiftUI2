//
//  ProfileHeader.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

struct ProfileHeader: View {
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

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(user: User.MOCK_USERS.first!)
    }
}

// MARK: - ProfileStats
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
