//
//  Font+Custom.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

extension Font {
    static func primary(size: CGFloat, isBold: Bool = false) -> Font {
        isBold ? Font.custom("Lato-Bold", size: size) : .custom("Lato-Regular", size: size)
    }
    
    static func secondary(size: CGFloat) -> Font {
        .custom("Inconsolata-Light", size: size)
    }
}
