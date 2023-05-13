//
//  InstagramLogoView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

enum LogoSize {
    case small
    case large
    
    var width: CGFloat {
        switch self {
        case .small:
            return 100
        case .large:
            return 200
        }
    }
    
    var height: CGFloat {
        switch self {
        case .small:
            return 60
        case .large:
            return 120
        }
    }
}

struct IGLogoView: View {
    let size: LogoSize
    
    init(_ size: LogoSize) {
        self.size = size
    }
    
    var body: some View {
        Image("instagram-wide-logo")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.primary)
            .frame(width: size.width, height: size.height)
    }
}

struct InstagramLogoView_Previews: PreviewProvider {
    static var previews: some View {
        IGLogoView(.large)
    }
}
