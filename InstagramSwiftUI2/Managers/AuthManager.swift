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
    func login(email: String, password: String) async throws {
        
    }
    
    func register(username: String, email: String, password: String) async throws {
        
    }
    
    func loadUserdata() async throws {
        
    }
    
    func logout() {
        
    }
}
