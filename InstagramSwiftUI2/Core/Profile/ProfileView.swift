//
//  ProfileView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct ProfileView: View {
    private let columns = [
        GridItem(spacing: 1), GridItem(spacing: 1), GridItem(spacing: 1)
    ]
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Profile Pic And Stats
                    HStack {
                        Image("profile_pic")
                            .resizable()
                            .frame(width: 88, height: 88)
                            .clipShape(Circle())
                        
                        Spacer(minLength: 0)
                        
                        ProfileStats(name: "Posts", amount: 3)
                        
                        Spacer(minLength: 0)
                        
                        ProfileStats(name: "Followers", amount: 1)
                        
                        Spacer(minLength: 0)
                        
                        ProfileStats(name: "Following", amount: 2)
                    }
                    .padding(.horizontal)
                    
                    // Profile Name and description
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("FUTURE HNDRXX").font(.headline)
                        
                        Text("I Never Liked You Out Now 🦅").font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                            .padding(.horizontal)
                            .tint(.primary)
                            .bold()
                    }

                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(0..<4, id: \.self) { _ in
                            Image("post_pic")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fill)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

private struct ProfileStats: View {
    let name: String
    let amount: Int
    
    var body: some View {
        VStack {
            Text(String(amount))
                .bold()
            
            Text(name)
                .font(.callout)
        }
    }
}
