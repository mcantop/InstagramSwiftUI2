//
//  CompleteRegistrationView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct CompleteRegistrationView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            VStack(spacing: 12) {
                Text("Welcome to Instagram, future")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Click below to complete registration and start using Instagram.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .multilineTextAlignment(.center)
                        
            IGWideButton("Let's get it!", style: .blue) { }
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
    }
}

struct CompleteRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRegistrationView()
    }
}
