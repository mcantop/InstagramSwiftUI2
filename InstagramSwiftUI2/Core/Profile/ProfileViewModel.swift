//
//  ProfileViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 27/05/2023.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    let user: User
    
    @Published var presentingEditProfile = false
    @Published var posts: [Post] = []
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserPosts() }
    }
}

// MARK: - Private API
private extension ProfileViewModel {
    @MainActor
    func fetchUserPosts() async throws {
        posts = try await PostsManager.fetchUserPosts(user: user)
    }
}
