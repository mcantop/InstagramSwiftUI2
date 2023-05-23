//
//  IGTabBar.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

struct IGTabBar: View {
    @EnvironmentObject var appManager: AppManager
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack {
                ForEach(TabType.allCases) { type in
                    IGTabButton(type: type)
                }
            }
            .font(.title2)
            .padding(.top, 4)
            .background(.thinMaterial)
        }
    }
}

struct IGTabBar_Previews: PreviewProvider {
    static var previews: some View {
        IGTabBar()
            .environmentObject(AppManager())
    }
}
