//
//  ThreemanState.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

class ThreemanState: DrinkingGameState {
    init() {
        let random = [Int.random(in: 1...6), Int.random(in: 1...6)]
        super.init(initialValue: random)
    }
}
