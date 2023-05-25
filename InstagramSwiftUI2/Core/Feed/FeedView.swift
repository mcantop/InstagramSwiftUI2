//
//  FeedView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct FeedView: View {    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(Post.MOCK_POSTS) { post in
                    FeedCell(post: post)
                }
            }
            .padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
