//
//  ContentView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SigninView()
                /// RegistrationFlowViewModel Initialization
                    .environmentObject(RegistrationFlowViewModel())
            } else if let user = viewModel.currentUser {
                MainTabView(user: user)
            }
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
