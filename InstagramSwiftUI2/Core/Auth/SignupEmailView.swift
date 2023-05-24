//
//  AddEmailView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct SignupEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationFlowViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                Text("Add your email")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("You will use this email to log in to your account.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            IGTextField(
                placeholder: "Email",
                text: $viewModel.email
            )
            
            IGWideButton(
                "Next",
                style: .blue,
                destination: SignupUsernameView()
            )
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                
            }
        }
    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignupEmailView()
                .environmentObject(RegistrationFlowViewModel())
        }
    }
}
