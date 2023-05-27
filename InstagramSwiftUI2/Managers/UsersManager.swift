//
//  UsersManager.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 25/05/2023.
//

import Foundation
import Firebase

struct UsersManager {
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
    
    static func fetchUser(uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self) /// Decoding user, transforming from data dictionary to model
    }
}
