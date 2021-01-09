//
//  CircularButton.swift
//  Tomando
//
//  Created by juandahurt on 7/01/21.
//

import SwiftUI

struct CircularButton: ButtonStyle {
    var diameter: CGFloat
    
    var mainColor: Color
    var darkColor: Color
    var lightColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .offset(x: 0, y: configuration.isPressed ? yOffset : 0)
            .frame(maxWidth: diameter, maxHeight: diameter)
            .background(ZStack {
                Circle()
                    .fill(configuration.isPressed ? lightColor : darkColor)
                    .frame(width: diameter, height: diameter)
                    .offset(x: 0, y: yOffset)
                Circle()
                    .fill(configuration.isPressed ? Color.clear : mainColor)
                    .frame(width: diameter, height: diameter)
            }
            )
    }

    let yOffset: CGFloat = 10
}
