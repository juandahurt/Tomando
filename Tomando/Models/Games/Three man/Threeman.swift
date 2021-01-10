//
//  Threeman.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class Threeman: DrinkingGame<ThreemanState, ThreemanRule> {
    init() {
        super.init(id: 1, name: "Threeman", minPlayers: 3, initalState: ThreemanState())
    }
    
    override func start() {
        print("starting game...")
        print("state: \(currentState.dices)")
    }
    
    override func next(completion: @escaping () -> Void) {
        currentState.rollDices()
        print(currentState.dices)
        validateRules()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
    
    override func validateRules() -> [ThreemanRule] {
        var rules = [ThreemanRule]()
        
        for rule in ThreemanRule.rules {
            if rule.validator(currentState) {
                rules.append(rule)
            }
        }
        
        print(rules)
        
        return rules
    }
}
