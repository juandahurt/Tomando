//
//  View+CornerRadius.swift
//  Tomando
//
//  Created by juandahurt on 27/12/20.
//

import SwiftUI
 
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
