//
//  CreateUsernameView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct SignupUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationFlowViewModel

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                Text("Create username")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Pick a username for your new account. You can always change it later.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            IGTextField(
                placeholder: "Username",
                text: $viewModel.username
            )
            
            IGWideButton(
                "Next",
                style: .blue,
                destination: SignupPasswordView()
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignupUsernameView()
        }
    }
}
