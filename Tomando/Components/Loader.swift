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
    
    init(repeatCount: Int = .max, diameter: CGFloat = 175, speed: Double = 0.25, lineWidth: CGFloat = 18) {
        self.numberOfRepeatitions = repeatCount
        self.diameter = diameter
        self.speed = speed
        self.lineWidth = lineWidth
        self.lightOffset = 9
    }
    
    var body: some View {
            ZStack {
                Circle()
                    .stroke(Color("Primary").opacity(0.06), lineWidth: lineWidth)
                    .frame(width: diameter, height: diameter)
                Circle()
                    .trim(from: 0.0, to: 0.4)
                    .stroke(
                        Color("Primary"),
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
                        Color.white.opacity(0.1),
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
