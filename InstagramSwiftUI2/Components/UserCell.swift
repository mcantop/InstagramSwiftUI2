//
//  UserCell.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var showFullName: Bool
    
    init(_ user: User, showFullName: Bool = false) {
        self.user = user
        self.showFullName = showFullName
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(user.profileImageUrl ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.headline)
                
                if let fullname = user.fullname, showFullName {
                    Text(fullname)
                        .font(.subheadline)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 8)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(User.MOCK_USERS.first!, showFullName: true)
    }
}
