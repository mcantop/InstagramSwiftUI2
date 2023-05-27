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
            HStack(spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.headline)
                }
                
                if let pronouns = user.pronouns {
                    Text(pronouns)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            
            if let bio = user.bio {
                Text(bio)
                    .font(.subheadline)
            }
            
            if let links = user.links {
                HStack(spacing: 4) {
                    Image(systemName: "link")
                    
                    Link(links, destination: URL(string: links)!)
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.vertical, 4)
            }
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
