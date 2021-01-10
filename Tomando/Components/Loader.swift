//
//  Loader.swift
//  Tomando
//
//  Created by juandahurt on 7/01/21.
//

import SwiftUI

struct Loader: View {
    @State var isAnimating = false
    
    var numberOfRepeatitions: Int
    var diameter: CGFloat
    var speed: Double
    var lineWidth: CGFloat
    var lightOffset: CGFloat
    
    var color: Color
    var opacity: Double
    var lightColor: Color
    
    init(repeatCount: Int = .max, diameter: CGFloat = 175, speed: Double = 0.25, lineWidth: CGFloat = 18, color: Color = Color("Primary"), opacity: Double = 0.06, lightColor: Color = Color.white.opacity(0.1)) {
        self.numberOfRepeatitions = repeatCount
        self.diameter = diameter
        self.speed = speed
        self.lineWidth = lineWidth
        self.lightOffset = 9
        
        self.color = color
        self.opacity = opacity
        self.lightColor = lightColor
    }
    
    var body: some View {
            ZStack {
                Circle()
                    .stroke(color.opacity(opacity), lineWidth: lineWidth)
                    .frame(width: diameter, height: diameter)
                Circle()
                    .trim(from: 0.0, to: 0.4)
                    .stroke(
                        color,
                        style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .rotationEffect(isAnimating ? .degrees(360) : .zero)
                    .animation(Animation.easeOut.repeatCount(numberOfRepeatitions, autoreverses: false).speed(speed))
                    .frame(width: diameter, height: diameter)
                Circle()
                    .trim(from: 0.0, to: 0.4)
                    .stroke(
                        lightColor,
                        style: StrokeStyle(
                            lineWidth: 3,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .rotationEffect(isAnimating ? .degrees(360) : .zero)
                    .animation(Animation.easeOut.repeatCount(numberOfRepeatitions, autoreverses: false).speed(speed))
                    .frame(width: diameter + lightOffset, height: diameter + lightOffset)
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            isAnimating.toggle()
        }
    }
}
