//
//  ProfileImage.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 26/05/2023.
//

import SwiftUI

enum ProfileImageSize {
    case small
    case large
    
    var dimensions: CGFloat {
        switch self {
        case .small:
            return 44
        case .large:
            return 88
        }
    }
}


struct ProfileImage: View {
    let profileImage: Image?
    let profileImageString: String?
    let size: ProfileImageSize
    
    init(_ profileImage: Image?, size: ProfileImageSize) {
        self.profileImage = profileImage
        self.profileImageString = nil
        self.size = size
    }
    
    init(_ profileImageString: String?, size: ProfileImageSize) {
        self.profileImage = nil
        self.profileImageString = profileImageString
        self.size = size
    }
    
    var body: some View {
        if let profileImage {
            profileImage
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else {
            Image(profileImageString ?? "Default_profile_pic")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfileImage(User.MOCK_USERS.first!.profileImageUrl, size: .small)
            ProfileImage(User.MOCK_USERS.first!.profileImageUrl, size: .large)
        }
    }
}
