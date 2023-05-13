//
//  UserModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            username: "future",
            profileImageUrl: "profile_pic",
            fullname: "FUTURE HNDRXX",
            bio: "I Never Liked You",
            email: "future@mail.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "thuggerthugger1",
            profileImageUrl: "thugger",
            fullname: "SEX!",
            bio: "Free Me",
            email: "thugger@mail.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "playboicarti",
            profileImageUrl: "carti",
            fullname: "Carti",
            bio: "I been on opium for the last 10 days",
            email: "carti@mail.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "youngsavage",
            profileImageUrl: "21savage",
            fullname: "21 Savage",
            bio: "Young Savage why u trappin so hard, why u got 12 car garage, huh????",
            email: "savage@mail.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "gunna",
            profileImageUrl: "gunna",
            fullname: "WUNNA",
            bio: "#YSL_THE_LABEL",
            email: "gunna@mail.com"
        )
    ]
}
