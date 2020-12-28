//
//  RegularText.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct CuteText: View {
    var text: String
    var color: Color
    var font: Font
    
    init(_ text: String, color: Color = .text, font: Font = .primary(size: 20)) {
        self.text = text
        self.color = color
        self.font = font
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(font)
    }
}
