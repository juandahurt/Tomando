//
//  RealButton.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct CuteButton: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var font: Font
    
    var isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(font)
            .frame(maxWidth: .infinity, maxHeight: 51)
            .foregroundColor(
                isDisabled ? foregroundColor.opacity(opacityWhenDisabled)
                    : foregroundColor.opacity(configuration.isPressed ? opacityWhenPressed : 1)
            )
            .background(
                isDisabled ? backgroundColor.opacity(opacityWhenDisabled)
                    : backgroundColor.opacity(configuration.isPressed ? opacityWhenPressed : 1)
            )
            .cornerRadius(10)
    }
    
    let opacityWhenPressed: Double = 0.7
    let opacityWhenDisabled: Double = 0.6
}
