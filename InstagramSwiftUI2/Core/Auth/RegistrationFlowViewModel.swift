//
//  RegistrationFlowViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 24/05/2023.
//

import Foundation

final class RegistrationFlowViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
}

// MARK: - Public API
extension RegistrationFlowViewModel {
    func signup() async throws {
        try await AuthManager.shared.signup(email: email, username: username, password: password)
        resetTextFields()
    }
}

// MARK: - Private API
private extension RegistrationFlowViewModel {
    func resetTextFields() {
        username = ""
        email = ""
        password = ""
    }
}
