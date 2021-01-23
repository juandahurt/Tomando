//
//  Responsive.swift
//  Putis
//
//  Created by juandahurt on 23/01/21.
//

import Foundation
import SwiftUI

struct Responsive {
    private static let baseHeight: CGFloat = 667
    private static let baseWidth: CGFloat = 375
    private static let screenSize = UIScreen.main.bounds.size
    
    static func redimension(_ value: CGFloat, on axis: Axis.Set) -> CGFloat {
        var newValue: CGFloat = 0
        switch axis {
        case .vertical:
            let screenPercentage = Double(value / Responsive.baseHeight)
            newValue = Responsive.screenSize.height * CGFloat(screenPercentage)
            break
        case .horizontal:
            let screenPercentage = Double(value / Responsive.baseWidth)
            newValue = Responsive.screenSize.width * CGFloat(screenPercentage)
            break
        default:
            break
        }
        return newValue
    }
}

