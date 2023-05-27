//
//  MainTabView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appManager: AppManager
    @StateObject private var exploreViewModel = ExploreViewModel() /// Why is creating a stateobject inside navigationstack causing a double init of the state object?
    @State private var path = NavigationPath()
    let user: User

    private var navigationTitle: String {
        return appManager.selectedTab.rawValue.capitalized
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .bottom) {
                SelectedTabView()
                    .environmentObject(exploreViewModel)
                
                IGTabBar()
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            // MARK: - Upload Post Sheet
            .sheet(isPresented: $appManager.presentingUpload) {
                UploadPostView()
            }
            // MARK: - Toolbar
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if isSelected(.feed) {
                        IGLogoView(.small)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if isSelected(.feed) {
                        ImageButton("paperplane") { }
                    } else if isSelected(.profile) {
                        ImageButton("line.3.horizontal") {
                            AuthManager.shared.signout()
                        }
                    }
                }
            }
            // MARK: - User Profile Navigation
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
                    .navigationTitle(user.username)
            }
        }
    }
    
    @ViewBuilder
    private func SelectedTabView() -> some View {
        ForEach(TabType.allCases) { type in
            AnyView(type.view(user: user))
                .opacity(isSelected(type) ? 1 : 0)
        }
    }
    
    private func isSelected(_ type: TabType) -> Bool {
        return appManager.selectedTab == type
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS.first!)
            .environmentObject(AppManager())
    }
}
