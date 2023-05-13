//
//  BottomAuthLabel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct BottomAuthLabel: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("Don't have an account?")
            
            Text("Sign up")
                .bold()
        }
        .font(.footnote)
        .foregroundColor(.blue)
    }
}

struct BottomAuthLabel_Previews: PreviewProvider {
    static var previews: some View {
        BottomAuthLabel()
    }
}
