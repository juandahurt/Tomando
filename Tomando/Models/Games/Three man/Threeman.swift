//
//  Threeman.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class Threeman: DrinkingGame {
    var threeman: Player?
    
    init() {
        let name = "Three man"
        super.init(id: 1, name: name, minPlayers: 3)
        self.log.append(.init(text: "Juego seleccionado: \(name)."))
    }
    
    override func start() {
        self.started = true
        log.append(.init(text: "Eligiendo aleatoriamente un three man..."))
        self.threeman = self.players.randomElement()!
        self.log.append(.init(text: "Threeman seleccionado: \(self.threeman!.name)", level: .alert))
        self.log.append(.empty)
        self.log.append(.empty)
        self.log.append(.empty)
        self.log.append(.init(text: "\(threeman!.name), dios te ampare."))
    }
    
    override func update() {
        
    }
    
    override func nextTurn() {
        
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
