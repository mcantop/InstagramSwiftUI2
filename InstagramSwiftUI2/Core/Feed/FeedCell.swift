//
//  FeedCell.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack(spacing: 8) {
            UserCell(post.user!)
            
            Image(post.imageUrl)
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 16) {
                    FeedCellActionButton(imageName: "heart") { }
                    FeedCellActionButton(imageName: "message") { }
                    FeedCellActionButton(imageName: "paperplane") { }
                    
                    Spacer(minLength: 0)
                }
                
                Text(post.likes.toString() + " likes").bold()
                
                Text(post.user?.username ?? "username").bold() + Text(" ") + Text(post.caption)
                
                Text(post.timestamp.formatted())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: .MOCK_POSTS.first!)
    }
}

struct FeedCellActionButton: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .font(.title)
        }
    }
}
