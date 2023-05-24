//
//  LoginView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct SigninView: View {
    @StateObject private var viewModel = SigninViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Spacer(minLength: 0)
                
                IGLogoView(.large).padding(.bottom, -16)
                
                VStack(spacing: 8) {
                    IGTextField(
                        placeholder: "Email",
                        text: $viewModel.email
                    )
                    
                    IGTextField(
                        placeholder: "Password",
                        text: $viewModel.password,
                        isSecured: true
                    )
                }
                
                ForgotPasswordButton()
                
                IGWideButton("Sign In", style: .blue) {
                    Task { try await viewModel.signin() }
                }
                
                ORSeperatorView()
                
                FacebookContinueButton()
                
                Spacer(minLength: 0)
                
                NavigationLink {
                    SignupEmailView()
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
        SigninView()
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

// MARK: - FacebookContinueButton
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

// MARK: - ForgotPasswordButton
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

// MARK: - BottomAuthLabel
private struct BottomAuthLabel: View {
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
