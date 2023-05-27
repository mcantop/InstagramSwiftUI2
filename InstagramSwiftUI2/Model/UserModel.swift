//
//  UserModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    var profileImageUrl: String?
    var username: String
    var fullname: String?
    var pronouns: String?
    var bio: String?
    var links: String?
    var gender: Int?
    
    var isCurrentUser: Bool {
        return id == Auth.auth().currentUser?.uid
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            email: "future@mail.com",
            profileImageUrl: nil,
            username: "future",
            fullname: "FUTURE HNDRXX",
            pronouns: "he/him",
            bio: "I Never Liked You",
            links: "https://futureofficial.shop"
        ),
        .init(
            id: UUID().uuidString,
            email: "thugger@mail.com",
            profileImageUrl: nil,
            username: "thuggerthugger1",
            fullname: "SEX!",
            bio: "Free Me"
        ),
        .init(
            id: UUID().uuidString,
            email: "carti@mail.com",
            profileImageUrl: nil,
            username: "playboicarti",
            fullname: "Carti",
            bio: "I been on opium for the last 10 days"
        ),
        .init(
            id: UUID().uuidString,
            email: "savage@mail.com",
            profileImageUrl: nil,
            username: "youngsavage",
            fullname: "21 Savage",
            bio: "Young Savage why u trappin so hard, why u got 12 car garage, huh????"
        ),
        .init(
            id: UUID().uuidString,
            email: "gunna@mail.com",
            profileImageUrl: nil,
            username: "gunna",
            fullname: "WUNNA",
            bio: "#YSL_THE_LABEL"
        )
    ]
}
