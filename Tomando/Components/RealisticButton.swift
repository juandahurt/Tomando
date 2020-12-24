//
//  RealisticButton.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct RealisticButton: View {
    var text: String
    var font: Font
    var backgroundColor: Color
    var isDisabled: Bool
    
    init(_ text: String, font: Font = .primary(size: 20), backgroundColor: Color = .secondary, isDisabled: Bool) {
        self.text = text
        self.font = font
        self.backgroundColor = backgroundColor
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Button(text) {
            print("Buscando...")
        }
            .buttonStyle(
                RealButton(
                    backgroundColor: .secondary,
                    foregroundColor: .white,
                    isDisabled: isDisabled
                )
            )
    }
}
