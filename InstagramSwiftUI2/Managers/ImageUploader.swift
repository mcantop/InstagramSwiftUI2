//
//  ImageUploader.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 27/05/2023.
//

import UIKit
import Firebase
import FirebaseStorage

enum ImageUploadType: String {
    case profile
    case post
    
    var compressionQuality: CGFloat {
        switch self {
        case .profile:
            return 0.33
        case .post:
            return 0.66
        }
    }
    
    var storagePath: String {
        switch self {
        case .profile:
            return "profile_images"
        case .post:
            return "post_images"
        }
    }
}

struct ImageUploader {
    static func uploadImage(_ image: UIImage, type: ImageUploadType) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: type.compressionQuality) else { return nil }
        let filename = UUID().uuidString
        let reference = Storage.storage().reference(withPath: "/\(type.storagePath)/\(filename)")
        
        do {
            let _ = try await reference.putDataAsync(imageData)
            let url = try await reference.downloadURL()
            return url.absoluteString
        } catch {
            print("[DEBUG] Failed to upload \(type.rawValue) image with error - \(error.localizedDescription)")
            return nil
        }
    }
}
