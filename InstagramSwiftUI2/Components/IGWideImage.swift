//
//  IGWideImage.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI
import Kingfisher

struct IGWideImage: View {
    let image: Image?
    let imageString: String?
    
    init(_ image: Image) {
        self.image = image
        self.imageString = nil
    }
    
    init(_ imageString: String) {
        self.imageString = imageString
        self.image = nil
    }
    
    var body: some View {
        if let imageString {
            KFImage(URL(string: imageString))
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
        }
    }
    
//    private func imageContent() -> Image {
//        if let image {
//            return image
//        } else if let imageString{
//            return KFImage(URL(string: imageString))
//        } else {
//            return Image(systemName: "xmark")
//        }
//    }
}

struct IGWideImage_Previews: PreviewProvider {
    static var previews: some View {
        IGWideImage(Post.MOCK_POSTS.first!.imageUrl)
    }
}

