//
//  EditProfileView.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 26/05/2023.
//

import SwiftUI
import PhotosUI

enum EditProfileField: String, CaseIterable, Identifiable {
    case fullname
    case username
    case pronouns
    case bio
    case links
    case gender
    
    var id: String {
        return self.rawValue
    }
    
    var name: String {
        return self.rawValue.capitalized
    }
}

enum GenderType: Int, CaseIterable, Identifiable, Hashable {
    case hidden
    case man
    case woman
    case trans
    case nonbinary
    
    var id: Int {
        return self.rawValue
    }
    
    var string: String {
        switch self {
        case .hidden:
            return "Prefer not to say"
        case .man:
            return "Man"
        case .woman:
            return "Woman"
        case .trans:
            return "Trans"
        case .nonbinary:
            return "Nonbinary"
        }
    }
}

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel

    init(_ user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Divider()
                
                VStack(spacing: 16) {
                    Spacer(minLength: 0)
                    
                    Button {
                        viewModel.presentingImagePicker.toggle()
                    } label: {
                        VStack(spacing: 16) {
                            ProfileImage(viewModel.selectedImage, size: .large)
                            
                            Text("Edit profile picture")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Divider()
                    
                    ForEach(EditProfileField.allCases) { field in
                        if field == .gender {
                            EditProfileGenderPicker(gender: $viewModel.gender)
                        } else {
                            EditProfileTextField(field: field, text: binding(for: field))
                                .autocorrectionDisabled()
                        }
                    }
                }
            }
            .photosPicker(
                isPresented: $viewModel.presentingImagePicker,
                selection: $viewModel.selectedItem
            )
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
    
    private func binding(for field: EditProfileField) -> Binding<String> {
        switch field {
        case .fullname:
            return $viewModel.fullname
        case .username:
            return $viewModel.username
        case .pronouns:
            return $viewModel.pronouns
        case .bio:
            return $viewModel.bio
        default:
            return $viewModel.links
        }
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView(User.MOCK_USERS.first!)
//    }
//}

private struct EditProfileTextField: View {
    let field: EditProfileField
    @Binding var text: String
    
    private var isLastTextField: Bool {
        return field == .links
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                Text(field.name)
                    .padding(.leading)
                    .frame(width: 100, alignment: .leading)
                
                VStack(spacing: 16) {
                    TextField(field.name, text: $text)
                    
                    if isLastTextField {
                        Spacer(minLength: 0)
                    } else {
                        Divider()
                    }
                }
            }
            
            if isLastTextField {
                Divider()
            }
        }
    }
}

private struct EditProfileGenderPicker: View {
    @Binding var gender: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                Text("Gender")
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 16) {
                    Picker("Gender", selection: $gender) {
                        ForEach(GenderType.allCases) { gender in
                            Text(gender.string)
                                .tag(gender.id)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 0)
                }
                .frame(height: 38)
            }
            
            Divider()
        }
    }
}
