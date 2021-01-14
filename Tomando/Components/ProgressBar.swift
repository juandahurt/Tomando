//
//  ProgressBar.swift
//  Tomando
//
//  Created by juandahurt on 12/01/21.
//

import SwiftUI

struct ProgressBar: View {
    var width: CGFloat
    var height: CGFloat
    var xPadding: CGFloat
    var percentage: Double
    var progressBarWdith: CGFloat
    var barColor: Color
    var showIndicator: Bool
    
    init(width: CGFloat = .infinity, height: CGFloat = 12, xPadding: CGFloat = 20, percentage: Double, barColor: Color, showIndicator: Bool = true) {
        self.height = height
        if width == .infinity {
            self.width = UIScreen.main.bounds.width - 2 * xPadding
        } else {
            self.width = width
        }
        self.xPadding = xPadding
        self.percentage = percentage
        self.progressBarWdith = self.width * CGFloat(percentage)
        self.barColor = barColor
        self.showIndicator = showIndicator
    }
    
    func indicator(in size: CGSize) -> some View {
        Group {
            if showIndicator {
                Path { path in
                    path.move(to: CGPoint(x: width * 0.3, y: 2))
                    path.addLine(to: CGPoint(x: width * 0.3, y: height + 2))
                }
                .stroke(Color("Green"), style: StrokeStyle(lineWidth: 1.5, dash: [2]))
            } else {
                EmptyView()
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(backgroundColor)
                .frame(height: height)
            GeometryReader { geometry in
                indicator(in: geometry.size)
            }
            RoundedRectangle(cornerRadius: 15)
                .fill(barColor)
                .frame(width: progressBarWdith, height: height)
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(lightColor)
                    .frame(width: progressBarWdith > 0 ? progressBarWdith - 10 : 0, height: 3)
                    .padding(.top, 3)
                    .padding(.leading, 5)
                Spacer()
            }
        }
        .padding(.horizontal, xPadding)
        .frame(height: height)
        .animation(.easeOut)
    }
    
    let backgroundColor = Color("White-Dark").opacity(0.1)
    let lightColor = Color.white.opacity(0.1)
}
