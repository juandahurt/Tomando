//
//  CuteSecondaryButton.swift
//  Tomando
//
//  Created by juandahurt on 11/01/21.
//

import SwiftUI

struct CuteSecondaryButton: ButtonStyle {
    var font: Font?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(Color("White-Dark").opacity(0.1))
            .font(font == nil ? .primary(size: 16) : font)
            .frame(maxWidth: .infinity, maxHeight: 38)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("White-Dark").opacity(0.1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .animation(.none)
    }
}
