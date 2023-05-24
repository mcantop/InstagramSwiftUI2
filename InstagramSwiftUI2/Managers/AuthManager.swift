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
    func signin(email: String, password: String) async throws {
        
    }
    
    func signup(email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("[DEBUG] Failed to register user with error - \(error)")
        }
    }
    
    func loadUserdata() async throws {
        
    }
    
    func signout() {
        
    }
}
