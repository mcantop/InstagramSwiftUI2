//
//  PostModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let date: Date
    var user: User? /// see why we do it later on
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Winning without u.",
            likes: 1083793,
            imageUrl: "post_pic",
            date: .now,
            user: .MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Winning without u.",
            likes: 1083793,
            imageUrl: "post_pic",
            date: .now,
            user: .MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Winning without u.",
            likes: 1083793,
            imageUrl: "post_pic",
            date: .now,
            user: .MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Winning without u.",
            likes: 1083793,
            imageUrl: "post_pic",
            date: .now,
            user: .MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Soon out brothaz",
            likes: 1132980,
            imageUrl: "post_thugger",
            date: .now,
            user: .MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Im out... album on the way P #YSL",
            likes: 783917,
            imageUrl: "post_gunna",
            date: .now,
            user: .MOCK_USERS[4]
        )
    ]
}
