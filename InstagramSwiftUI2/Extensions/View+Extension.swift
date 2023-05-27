//
//  View+Extension.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 23/05/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func searchable(
        if condition: Bool,
        text: Binding<String>,
        placement: SearchFieldPlacement = .navigationBarDrawer(displayMode: .always),
        prompt: String
    ) -> some View {
        if condition {
            self.searchable(
                text: text,
                placement: placement,
                prompt: prompt)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func navigationTitle(
        if condition: Bool,
        title: String
    ) -> some View {
        if condition {
            self.navigationTitle(
                title)
        } else {
            self
        }
    }
}
