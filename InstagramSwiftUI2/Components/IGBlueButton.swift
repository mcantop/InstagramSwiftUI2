//
//  IGBlueButton.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct IGBlueButton: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Button {
            
        } label: {
            Text(text)
                .font(.headline)
                .padding(12)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(.blue)
                .cornerRadius(5)
        }
    }
}

struct IGBlueButton_Previews: PreviewProvider {
    static var previews: some View {
        IGBlueButton("Log in")
    }
}
