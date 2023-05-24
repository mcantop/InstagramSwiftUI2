//
//  SigninViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 24/05/2023.
//

import Foundation

final class SigninViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}

// MARK: - Public Helpers
extension SigninViewModel {
    func signin() async throws {
        try await AuthManager.shared.signin(email: email, password: password)
    }
}
