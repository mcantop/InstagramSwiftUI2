//
//  PostsManager.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 27/05/2023.
//

import Foundation
import Firebase

struct PostsManager {
    static private let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchAllPosts() async throws -> [Post] {
        var posts: [Post] = []
        let snapshot = try await postsCollection.getDocuments()
        posts = snapshot.documents.compactMap { try? $0.data(as: Post.self) }
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UsersManager.fetchUser(uid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(user: User) async throws -> [Post] {
        var posts: [Post] = []
        let snapshot = try await postsCollection
            .whereField("ownerUid", isEqualTo: user.id)
            .getDocuments()
        
        posts = snapshot.documents.compactMap { try? $0.data(as: Post.self) }
        
        for i in 0..<posts.count {
            posts[i].user = user
        }
        
        return posts
    }
}
