//
//  UploadPostViewModel.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI
import PhotosUI

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
    }
}
