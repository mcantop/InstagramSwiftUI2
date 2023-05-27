//
//  FeedViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 27/05/2023.
//

import Foundation
import Firebase

final class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        Task { try await fetchPosts() }
    }
}

// MARK: - Public API
extension FeedViewModel {
    
}

// MARK: - Private API
private extension FeedViewModel {
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        posts = snapshot.documents.compactMap { try? $0.data(as: Post.self) }
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UsersManager.fetchUser(uid: ownerUid)
            posts[i].user = postUser
        }
    }
}
