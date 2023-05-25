//
//  ProfileSubheader.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

struct ProfileSubheader: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let fullname = user.fullname {
                Text(user.username).font(.headline)
            }
            
            if let bio = user.bio {
                Text(bio).font(.subheadline)
            }
            
            Text(user.username)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct ProfileSubheader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(user: User.MOCK_USERS.first!)
    }
}
