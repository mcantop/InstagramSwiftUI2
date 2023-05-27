//
//  EditProfileViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 26/05/2023.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
final class EditProfileViewModel: ObservableObject {
    // MARK: - Published Properties
    var user: User

    @Published var fullname = ""
    @Published var username = ""
    @Published var pronouns = ""
    @Published var bio = ""
    @Published var links = ""
    @Published var gender = 0
    @Published var presentingImagePicker = false
    @Published var presentingErrorAlert = false
    @Published var selectedImage: Image?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedItem) } }
    }
    
    private var selectedUIImage: UIImage?
    
    // MARK: - Computed Properties
    var disallowUpload: Bool {
        // TODO: 
        return selectedImage == nil
    }
        
    // MARK: - Init
    init(user: User) {
        self.user = user
        self.username = user.username
        self.fullname = user.fullname ?? ""
        self.pronouns = user.pronouns ?? ""
        self.bio = user.bio ?? ""
        self.links = user.links ?? ""
        self.gender = user.gender ?? 0
    }
}

// MARK: - Public API
extension EditProfileViewModel {
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
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let selectedUIImage {
            let imageUrl = try? await ImageUploader.uploadImage(selectedUIImage, type: .profile)
            data["profileImageUrl"] = imageUrl
        }
        
        if !username.isEmpty && user.username != username {
            user.username = username
            data["username"] = username
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
            data["fullname"] = fullname
        }
        
        if !pronouns.isEmpty && user.pronouns != pronouns {
            user.pronouns = pronouns
            data["pronouns"] = pronouns
        }
        
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
            data["bio"] = bio
        }
        
        if !links.isEmpty && user.links != links {
            user.links = links
            data["links"] = links
        }
        
        if user.gender != gender {
            user.gender = gender
            data["gender"] = gender
        }
        
        guard !data.isEmpty else { return }
        try await Firestore.firestore().collection("users").document(user.id).updateData(data)
    }
}
