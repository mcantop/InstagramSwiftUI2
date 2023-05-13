//
//  InstagramTextField.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct IGTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecured: Bool = false
    
    var body: some View {
        Group {
            if isSecured {
                SecureField(placeholder, text: $text)

            } else {
                TextField(placeholder, text: $text)
                    .textInputAutocapitalization(.never)
            }
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(5)
    }
}

struct InstagramTextField_Previews: PreviewProvider {
    static var previews: some View {
        IGTextField(placeholder: "Enter your email", text: .constant(""))
    }
}
