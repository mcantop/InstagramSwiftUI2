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
        posts = try await PostsManager.fetchAllPosts()
    }
}
