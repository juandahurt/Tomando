//
//  CircularButton.swift
//  Tomando
//
//  Created by juandahurt on 7/01/21.
//

import SwiftUI

struct CuteCircularButton: ButtonStyle {
    var diameter: CGFloat
    var yOffset: CGFloat = 10
    
    var mainColor: Color
    var darkColor: Color
    var lightColor: Color
    
    var font: Font?
    
    var disabled = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(disabled ? Color.clear : darkColor)
            .font(font == nil ? .primary(size: 16) : font)
            .offset(x: 0, y: configuration.isPressed ? yOffset : 0)
            .frame(maxWidth: diameter, maxHeight: diameter)
            .background(
                Group {
                    if disabled {
                        Circle()
                            .fill(Color("White-Dark").opacity(0.1))
                            .frame(width: diameter, height: diameter)
                    } else {
                        ZStack {
                            Circle()
                                .fill(configuration.isPressed ? lightColor : darkColor)
                                .frame(width: diameter, height: diameter)
                                .offset(x: 0, y: yOffset)
                            Circle()
                                .fill(configuration.isPressed ? Color.clear : mainColor)
                                .frame(width: diameter, height: diameter)
                        }
                    }
                }
            )
            .animation(.none)
            .disabled(disabled)
    }
}
