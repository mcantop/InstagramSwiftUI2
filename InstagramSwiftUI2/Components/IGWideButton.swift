//
//  IGBlueButton.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

enum WideButtonStyle {
    case blue
    case blackWhite
}

struct IGWideButton: View {
    // MARK: - Public Properties
    let text: String
    var style: WideButtonStyle
    var destination: (any View)?
    let action: (() -> Void)?
    
    // MARK: - Computed Properties
    private var isWhite: Bool {
        return style == .blackWhite
    }
    
    private var buttonForegroundColor: Color {
        return isWhite ? .primary : .white
    }
    
    private var buttonBackgroundColor: Color {
        return isWhite ? .clear : .blue
    }
    
    // MARK: - Action Init
    init(_ text: String, style: WideButtonStyle, action: @escaping (() -> Void)) {
        self.text = text
        self.style = style
        self.destination = nil
        self.action = action
    }
    
    // MARK: - Destination Init
    init(_ text: String, style: WideButtonStyle, destination: any View) {
        self.text = text
        self.style = style
        self.destination = destination
        self.action = nil
    }
    
    var body: some View {
        Group {
            if let action {
                Button(action: action) {
                    buttonLabel
                }
            } else if let destination {
                NavigationLink(destination: AnyView(destination)) {
                    buttonLabel
                }
            }
        }
    }
    
    // MARK: - Button Label
    var buttonLabel: some View {
        Text(text)
            .foregroundColor(buttonForegroundColor)
            .bold()
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(buttonBackgroundColor)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: isWhite ? 1 : 0)
            )
    }
}

struct IGBlueButton_Previews: PreviewProvider {
    static var previews: some View {
        IGWideButton("next", style: .blue) { }
    }
}
