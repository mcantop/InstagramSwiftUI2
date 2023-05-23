//
//  ImageButton.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

struct ImageButton: View {
    let imageName: String
    let action: () -> Void
    
    init(_ imageName: String, action: @escaping () -> Void) {
        self.imageName = imageName
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
        }

    }
}

struct SimpleImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton("paperplane.fill") { }
    }
}
