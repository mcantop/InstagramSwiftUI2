//
//  TabType.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

enum TabType: String, Identifiable, CaseIterable  {
    case feed
    case explore
    case upload
    case notifications
    case profile
    
    var id: String {
        return self.rawValue
    }
    
    var imageName: String {
        switch self {
        case .feed:
            return "house"
        case .explore:
            return "magnifyingglass"
        case .upload:
            return "plus.square.fill"
        case .notifications:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    var imageNameFilled: String {
        return self != .explore ? imageName + ".fill" : imageName
    }
    
    var view: any View {
        switch self {
        case .feed:
            return FeedView()
        case .explore:
            return ExploreView()
        case .upload:
            return EmptyView() /// This view should never be visible, because  sheet appears on tap
        case .notifications:
            return NotificationView()
        case .profile:
            return ProfileView(user: User.MOCK_USERS.first!)
            
        }
    }
}
