//
//  CompleteRegistrationView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct SignupCompleteView: View {
    @EnvironmentObject var viewModel: RegistrationFlowViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            VStack(spacing: 12) {
                Text("Welcome to Instagram, \(viewModel.username)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Click below to complete registration and start using Instagram.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .multilineTextAlignment(.center)
                        
            IGWideButton(
                "Create Account",
                style: .blue
            ) {
                Task { try await viewModel.signup() }
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CompleteRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        SignupCompleteView()
    }
}
