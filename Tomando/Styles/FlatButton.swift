//
//  RealButton.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct FlatButton: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    
    var isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity, maxHeight: 30)
            .padding(10)
            .foregroundColor(
                isDisabled ? foregroundColor.opacity(opacityWhenDisabled)
                    : foregroundColor.opacity(configuration.isPressed ? opacityWhenPressed : 1)
            )
            .background(
                isDisabled ? backgroundColor.opacity(opacityWhenDisabled)
                    : backgroundColor.opacity(configuration.isPressed ? opacityWhenPressed : 1)
            )
            .font(.custom("Lato-Regular", size: 20))
    }
    
    let opacityWhenPressed: Double = 0.9
    let opacityWhenDisabled: Double = 0.5
}
