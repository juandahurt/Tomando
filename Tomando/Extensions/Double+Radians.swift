//
//  Double+Radians.swift
//  Tomando
//
//  Created by juandahurt on 27/12/20.
//

import Foundation

extension Double {
    static func deg2rad(_ number: Double) -> Double {
        return number * .pi / 180
    }
}
