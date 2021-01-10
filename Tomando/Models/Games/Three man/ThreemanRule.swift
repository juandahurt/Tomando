//
//  ThreemanRule.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

struct ThreemanRule: DrinkingGameRule, Identifiable {
    var id: Int
    var validator: (ThreemanState) -> Bool
    var nextToDrink: WhoDrinks
    var result: String
    
    enum WhoDrinks {
        case left, myself, right, threeman, noOne
    }
    
    init(whoDrinks: WhoDrinks, result: String ,validator: @escaping (ThreemanState) -> Bool) {
        self.id = .random(in: 0...1000)
        self.nextToDrink = whoDrinks
        self.result = result
        self.validator = validator
    }
}


extension ThreemanRule {
    static let rules = [
        ThreemanRule(whoDrinks: .left, result: "Toma el jugador a tu izquierda") { state in
            let sum = state.dices.reduce(0, +)
            return sum == 7
        },
        ThreemanRule(whoDrinks: .right, result: "¡Tomas tú!") { state in
            let sum = state.dices.reduce(0, +)
            return sum == 9
        },
        ThreemanRule(whoDrinks: .myself, result: "Toma el jugador a tu derecha") { state in
            let sum = state.dices.reduce(0, +)
            return sum == 11
        },
        ThreemanRule(whoDrinks: .threeman, result: "¡Toma el Three man!") { state in
            let sum = state.dices.reduce(0, +)
            return sum == 3 || state.dices.contains(3)
        },
        ThreemanRule(whoDrinks: .noOne, result: "Nadie toma.") { state in
            let sum = state.dices.reduce(0, +)
            return sum != 3 && !state.dices.contains(3) && sum != 7 && sum != 9 && sum != 11
        },
    ]
}
