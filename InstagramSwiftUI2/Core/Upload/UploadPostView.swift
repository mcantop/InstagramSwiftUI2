//
//  UploadPostView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 21/05/2023.
//

import SwiftUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // Post Image and Caption
                HStack {
                    
                }
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Upload") {
                        
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UploadPostView()
        }
    }
}
