//
//  IGTabButton.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

struct IGTabButton: View {
    @EnvironmentObject var appManager: AppManager
    let type: TabType
    
    private var isSelected: Bool {
        return appManager.selectedTab == type
    }
    
    private var imageName: String {
        return isSelected ? type.imageNameFilled : type.imageName
    }
    
    private var fontWeight: Font.Weight {
        return isSelected ? .semibold : .regular
    }
    
    var body: some View {
        Button {
            if type == .upload {
                appManager.presentingUpload.toggle()
            } else {
                appManager.selectedTab = type
            }
        } label: {
            Image(systemName: imageName)
                .frame(width: 44, height: 44)
                .fontWeight(fontWeight)
        }
        .frame(maxWidth: .infinity)
    }
}

struct IGTabButton_Previews: PreviewProvider {
    static var previews: some View {
        IGTabButton(type: .feed)
            .environmentObject(AppManager())
    }
}
