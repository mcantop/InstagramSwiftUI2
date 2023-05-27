//
//  ExploreViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 25/05/2023.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        users = try await UsersManager.fetchAllUsers()
    }
}
