//
//  UploadPostViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore

@MainActor
final class UploadPostViewModel: ObservableObject {
    @Published var caption = ""
    @Published var presentingImagePicker = false
    @Published var presentingErrorAlert = false
    @Published var selectedImage: Image?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedItem) } }
    }
    
    var disallowUpload: Bool {
        return selectedImage == nil
    }
    
    private var selectedUIImage: UIImage?
}

// MARK: - Public API
extension UploadPostViewModel {
    func uploadPost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = selectedUIImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(uiImage, type: .post) else { return }
        
        let postReference = Firestore.firestore().collection("posts").document()
        
        let post = Post(
            id: postReference.documentID,
            ownerUid: uid,
            caption: caption,
            likes: 0,
            imageUrl: imageUrl,
            date: Date()
        )
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postReference.setData(encodedPost)
    }
}

// MARK: - Private API
private extension UploadPostViewModel {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data)
        else {
            presentingErrorAlert.toggle()
            selectedImage = nil
            return
        }
        
        selectedImage = Image(uiImage: uiImage)
        selectedUIImage = uiImage
    }
}
