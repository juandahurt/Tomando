//
//  RealButton.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct CutePrimaryButton: ButtonStyle {
    var yOffset: CGFloat = 5
    var mainColor: Color
    var darkColor: Color
    var lightColor: Color
    var font: Font?
    var disabled = false
    private let buttonHeight: CGFloat = Responsive.redimension(38, on: .vertical)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(disabled ? Color.gray : Color("White-Dark"))
            .font(font == nil ? .primary(size: Responsive.redimension(16, on: .vertical)) : font)
            .offset(x: 0, y: configuration.isPressed ? yOffset : 0)
            .frame(maxWidth: .infinity, maxHeight: buttonHeight)
            .background(
                Group {
                    if disabled {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("White-Dark").opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(configuration.isPressed ? lightColor : darkColor)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .offset(x: 0, y: yOffset)
                            RoundedRectangle(cornerRadius: 15)
                                .fill(configuration.isPressed ? Color.clear : mainColor)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
            )
            .animation(.none)
            .disabled(disabled)
    }
}
