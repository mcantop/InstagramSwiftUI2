//
//  AppManager.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import Foundation

final class AppManager: ObservableObject {
    @Published var presentingUpload = false
    @Published var selectedTab: TabType = .feed
}
