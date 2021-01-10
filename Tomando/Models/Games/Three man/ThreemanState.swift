//
//  ThreemanState.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

class ThreemanState: DrinkingGameState {
    var action: Action
    var dices: [Int]
    
    init() {
        action = .unknown
        dices = [Int.random(in: 1...6), Int.random(in: 1...6)]
    }
    
    func rollDices() {
        dices = [Int.random(in: 1...6), Int.random(in: 1...6)]
    }
}
