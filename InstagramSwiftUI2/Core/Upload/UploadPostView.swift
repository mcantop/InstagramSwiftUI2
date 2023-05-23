//
//  UploadPostView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 21/05/2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // MARK: - Image + Image Picker Button
                    Button {
                        viewModel.presentingImagePicker.toggle()
                    } label: {
                        if let image = viewModel.selectedImage {
                            IGWideImage(image)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                    
                    // MARK: - Caption TextField
                    if let _ = viewModel.selectedImage { /// Hide caption textfield if no image added
                        TextField(
                            "Enter your caption...",
                            text: $viewModel.caption,
                            axis: .vertical
                        )
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .photosPicker(
                    isPresented: $viewModel.presentingImagePicker,
                    selection: $viewModel.selectedItem
                )
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { viewModel.presentingImagePicker.toggle() }
            // MARK: - Toolbar
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // MARK: Cancel
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    // MARK: Upload
                    Button("Upload") {
                        
                    }
                    .fontWeight(.semibold)
                    .disabled(viewModel.disallowUpload)
                }
            }
        }
        .animation(.spring(), value: viewModel.selectedImage)
        .alert("Erorr", isPresented: $viewModel.presentingErrorAlert) {
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Something went wrong. Please try again.")
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
