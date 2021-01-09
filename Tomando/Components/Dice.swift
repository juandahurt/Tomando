//
//  Dice.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct Dice: View {
    var number: Int
    
    init(facing number: Int) {
        self.number = number
    }
    
    func whereDoIHaveToDrawTheCircles(in size: CGSize) -> [CirclePoint] {
        var points = [CirclePoint]()
        
        switch number {
            case 1:
                let p1 = CirclePoint(id: 1, point: CGPoint(x: size.width / 2, y: size.height / 2))
                points.append(p1)
                break
            case 2:
                let p1 = CirclePoint(id: 1, point: CGPoint(x: size.width - 12, y: 17))
                let p2 = CirclePoint(id: 2, point: CGPoint(x: 12, y: size.height - 17))
                points.append(p1)
                points.append(p2)
                break
            default:
                points = []
        }
        
        return points
    }
    
    var circle: some View {
        Circle()
            .fill(circleColor)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(shadowColor)
                .frame(width: diceSize.width, height: diceSize.height)
                .offset(x: 0, y: 5)
            RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor)
                .frame(width: diceSize.width, height: diceSize.height)
            GeometryReader { geometry in
                ForEach(whereDoIHaveToDrawTheCircles(in: geometry.size)) { circlePoint in
                    circle
                        .position(x: circlePoint.point.x, y: circlePoint.point.y)
                        .frame(width: circleDiameter, height: circleDiameter)
                }
            }
        }
        .frame(width: diceSize.width + 5, height: diceSize.height + 5)
    }
    
    let backgroundColor: Color = .white
    let shadowColor: Color = Color("White-Dark")
    
    let circleDiameter: CGFloat = 18
    let circleColor: Color = Color("Primary")
    let diceSize: CGSize = CGSize(width: 110, height: 110)
}

struct CirclePoint: Identifiable {
    var id: Int
    var point: CGPoint
}

struct Dice_Previews: PreviewProvider {
    static var previews: some View {
        Dice(facing: 2)
    }
}



