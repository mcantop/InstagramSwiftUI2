//
//  UserCell.swift
//  InstagramSwiftUI2
//
//  Created by Maciej on 13/05/2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("profile_pic")
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            
            Text("future").bold()
            
            Spacer()
        }
        .padding(.horizontal, 8)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
