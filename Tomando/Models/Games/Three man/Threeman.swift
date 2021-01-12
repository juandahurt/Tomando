//
//  Threeman.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class Threeman: DrinkingGame {
    init() {
        super.init(id: 1, name: "Three man", minPlayers: 3, initialState: ThreemanState())
    }
//    init() {
//        super.init(id: 1, name: "Three man", minPlayers: 3, initalState: ThreemanState())
//    }
//
//    override func start() {
//        print("starting game...")
//        print("state: \(currentState.dices)")
//    }
//
//    override func next(completion: @escaping ([ThreemanRule]) -> Void) {
//        currentState.rollDices()
//        print(currentState.dices)
//        DispatchQueue.main.asyncAfter(deadline: .now() + .random(in: 1.5...2.5)) {
//            completion(self.validateRules())
//        }
//    }
//
//    override func validateRules() -> [ThreemanRule] {
//        var rules = [ThreemanRule]()
//
//        for rule in ThreemanRule.rules {
//            if rule.validator(currentState) {
//                rules.append(rule)
//            }
//        }
//
//        return rules
//    }
}
