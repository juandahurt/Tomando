//
//  RealButton.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct RealButton: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity, maxHeight: 30)
            .padding(10)
            .foregroundColor(foregroundColor.opacity(configuration.isPressed ? opacityWhenPressed : 1))
            .background(backgroundColor.opacity(configuration.isPressed ? opacityWhenPressed : 1))
            .font(.custom("Lato-Regular", size: 20))
//            .overlay(
//                Rectangle()
//                    .stroke()
//                    .shadow(color: .white, radius: configuration.isPressed ? 0 : 2, x: 4, y: 4)
//            )
    }
    
    var opacityWhenPressed: Double = 0.9
}
