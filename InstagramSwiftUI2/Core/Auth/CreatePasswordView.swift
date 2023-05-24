//
//  CreatePasswordView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                Text("Create password")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Your password must be at least 6 characters long.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            IGTextField(
                placeholder: "Password",
                text: $password,
                isSecured: true
            )
            
            IGWideButton(
                "Next",
                style: .blue,
                destination: CompleteRegistrationView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
