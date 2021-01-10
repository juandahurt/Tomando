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
    
    func whereDoIHaveToDrawTheCircles(in size: CGSize) -> [DicePoint] {
        var points = [DicePoint]()
        
        switch number {
            case 1:
                points.append(.center)
                break
            case 2:
                points.append(.topRight)
                points.append(.bottomLeft)
                break
            case 3:
                points.append(.topRight)
                points.append(.center)
                points.append(.bottomLeft)
                break
            case 4:
                points.append(.topLeft)
                points.append(.topRight)
                points.append(.bottomLeft)
                points.append(.bottomRight)
                break
            case 5:
                points.append(.topLeft)
                points.append(.topRight)
                points.append(.center)
                points.append(.bottomLeft)
                points.append(.bottomRight)
                break
            case 6:
                points.append(.topLeft)
                points.append(.topRight)
                points.append(.left)
                points.append(.right)
                points.append(.bottomLeft)
                points.append(.bottomRight)
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
    
//  MARK: - Body
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
    
    
//  MARK: - Dice Point
    struct DicePoint: Identifiable {
        var id: Int
        var point: CGPoint
        
        static let diceSize: CGSize = CGSize(width: 110, height: 110)
        static let xOffset: CGFloat = 12
        static let yOffset: CGFloat = 17
        static let leftOffset: CGFloat = 5
        
        static let topLeft = DicePoint(id: 1, point: CGPoint(x: xOffset + leftOffset, y: yOffset))
        static let topRight = DicePoint(id: 2, point: CGPoint(x: diceSize.width - xOffset, y: yOffset))
        static let left = DicePoint(id: 3, point: CGPoint(x: xOffset + leftOffset, y: diceSize.height / 2))
        static let center = DicePoint(id: 4, point: CGPoint(x: diceSize.width / 2, y: diceSize.height / 2))
        static let right = DicePoint(id: 5, point: CGPoint(x: diceSize.width - xOffset, y: diceSize.height / 2))
        static let bottomLeft = DicePoint(id: 6, point: CGPoint(x: xOffset + leftOffset, y: diceSize.height - yOffset))
        static let bottomRight = DicePoint(id: 7, point: CGPoint(x: diceSize.width - xOffset, y: diceSize.height - yOffset))
    }
}

struct Dice_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Dice(facing: 1)
            Dice(facing: 2)
            Dice(facing: 3)
            Dice(facing: 4)
            Dice(facing: 5)
            Dice(facing: 6)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
    }
}
