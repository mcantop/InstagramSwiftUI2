//
//  AuthManager.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class AuthManager: ObservableObject {
    // MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthManager()
    
    // MARK: - Init
    init() {
        Task { try await loadUserdata() }
    }
}

// MARK: - Public API
extension AuthManager {
    @MainActor
    func signin(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            try await loadUserdata()
        } catch {
            print("[DEBUG] Failed to sign in user with error - \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signup(email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("[DEBUG] Failed to sign up user with error - \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserdata() async throws {
        userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        currentUser = try? snapshot.data(as: User.self) /// Decoding user, transforming from data dictionary to model
    }
    
    func signout() {
        try? Auth.auth().signOut()
        userSession = nil
        currentUser = nil
    }
}

// MARK: - Private API
private extension AuthManager {
    func uploadUserData(uid: String, username: String, email: String) async { /// That rarely ever goes wrong, you can just use async, no need for throws
        let user = User(id: uid, username: username, email: email)
        currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } /// Encoding user, transforming from model to data dictionary
        try? await Firestore.firestore().collection("users").document(uid).setData(encodedUser)
    }
}
