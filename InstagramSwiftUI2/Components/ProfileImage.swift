//
//  ProfileImage.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 26/05/2023.
//

import SwiftUI
import Kingfisher

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
    let image: Image?
    let imageUrl: String?
    let size: ProfileImageSize
    
    init(_ image: Image?, size: ProfileImageSize) {
        self.image = image
        self.imageUrl = nil
        self.size = size
    }
    
    init(_ imageUrl: String?, size: ProfileImageSize) {
        self.image = nil
        self.imageUrl = imageUrl
        self.size = size
    }
    
    var body: some View {
        if let imageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else if let image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        } else {
            Image("Default_profile_pic")
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
