//
//  PostGridView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 21/05/2023.
//

// https://stackoverflow.com/questions/62791912/how-do-you-clip-an-image-to-a-square-inside-a-lazy-grid-swiftui

import SwiftUI

struct PostGridView: View {
    let posts: [Post]
    private let columns = [GridItem(spacing: 1), GridItem(spacing: 1), GridItem(spacing: 1)]
    
    init(_ posts: [Post]) {
        self.posts = posts
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1) {
            ForEach(posts) { post in
                Rectangle()
                    .aspectRatio(1, contentMode: .fill)
                    .overlay {
                        Image(post.imageUrl)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(Post.MOCK_POSTS)
    }
}
