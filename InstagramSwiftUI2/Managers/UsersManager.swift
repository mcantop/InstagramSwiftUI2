//
//  UsersManager.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 25/05/2023.
//

import Foundation
import Firebase

struct UserService {
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        let users = documents.compactMap({ try? $0.data(as: User.self) })
        
        return users
    }
}
