//
//  AuthManager.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import Foundation
import FirebaseAuth

final class AuthManager: ObservableObject {
    // MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthManager()
    
    // MARK: - Init
    init() {
        self.userSession = Auth.auth().currentUser
    }
}

// MARK: - Public Helpers
extension AuthManager {
    @MainActor
    func signin(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("[DEBUG] Failed to sign in user with error - \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signup(email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("[DEBUG] Failed to sign up user with error - \(error.localizedDescription)")
        }
    }
    
    func loadUserdata() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        userSession = nil
    }
}
