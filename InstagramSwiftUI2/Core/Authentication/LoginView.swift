//
//  LoginView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Spacer(minLength: 0)
                
                IGLogoView(.large).padding(.bottom, -16)
                
                VStack(spacing: 4) {
                    IGTextField(
                        placeholder: "Enter your email",
                        text: $email
                    )
                    
                    IGTextField(
                        placeholder: "Password",
                        text: $password,
                        isSecured: true
                    )
                }
                
                ForgotPasswordButton()
                
                IGBlueButton("Log in")
                
                ORSeperatorView()
                
                FacebookContinueButton()
                
                Spacer(minLength: 0)
                
                NavigationLink {
                    
                } label: {
                    BottomAuthLabel()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

// MARK: - GrayLineView
private struct GrayLineView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(maxWidth: .infinity)
            .frame(height: 5)
            .foregroundColor(Color(.systemGray6))
    }
}

// MARK: - ORSeperatorView
private struct ORSeperatorView: View {
    var body: some View {
        HStack {
            GrayLineView()
            
            Text("OR")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            GrayLineView()
        }
    }
}

private struct FacebookContinueButton: View {
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 0) {
                Image("facebook-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                
                Text("Continue with Facebook")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
        }
    }
}

private struct ForgotPasswordButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}
