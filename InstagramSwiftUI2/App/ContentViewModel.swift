//
//  ContentViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 24/05/2023.
//

import Foundation
import FirebaseAuth
import Combine

final class ContentViewModel: ObservableObject {
    // MARK: - Properties
    @Published var userSession: FirebaseAuth.User?

    private let authManager = AuthManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init() {
        setupSubscribers()
    }
}

// MARK: - Private Helpers
private extension ContentViewModel {
    func setupSubscribers() {
        authManager.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
