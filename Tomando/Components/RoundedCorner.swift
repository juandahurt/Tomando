//
//  RoundedCorner.swift
//  Tomando
//
//  Created by juandahurt on 27/12/20.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = 20
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
