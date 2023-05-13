//
//  FeedCell.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(spacing: 8) {
            UserCell()
            
            Image("post_pic")
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
                
                Text("0 likes").bold()
                
                Text("future").bold() + Text(" ") + Text("Winning without u.")
                
                Text("6h")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
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
