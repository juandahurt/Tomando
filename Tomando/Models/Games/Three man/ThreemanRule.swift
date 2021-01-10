//
//  ThreemanRule.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

struct ThreemanRule: DrinkingGameRule {
    var validator: (ThreemanState) -> Bool
    var nextToDrink: WhoDrinks
    
    enum WhoDrinks {
        case left, myself, right, threeman
    }
    
    init(whoDrinks: WhoDrinks, validator: @escaping (ThreemanState) -> Bool) {
        self.nextToDrink = whoDrinks
        self.validator = validator
    }
}


extension ThreemanRule {
    static let rules = [
        ThreemanRule(whoDrinks: .left) { state in
            let sum = state.dices.reduce(0, +)
            return sum == 7
        },
        ThreemanRule(whoDrinks: .right) { state in
            let sum = state.dices.reduce(0, +)
            return sum == 9
        },
        ThreemanRule(whoDrinks: .myself) { state in
            let sum = state.dices.reduce(0, +)
            return sum == 11
        },
    ]
}
