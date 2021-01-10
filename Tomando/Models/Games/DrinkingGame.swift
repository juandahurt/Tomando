//
//  Game.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class DrinkingGame<GameState, GameRule>: Identifiable where GameState: DrinkingGameState, GameRule: DrinkingGameRule {
    var id: Int
    var name: String
    var players: [Player]
    var minPlayers: Int
    
    var currentState: GameState
    var rules: [GameRule]
    
    init(id: Int, name: String, minPlayers: Int, initalState: GameState) {
        self.id = id
        self.name = name
        self.players = []
        self.minPlayers = minPlayers
        self.currentState = initalState
        self.rules = []
    }
    
    func start() {}
    
    func next(completion: @escaping () -> Void) {}
    
    func validateRules() -> [GameRule] { return [] }
}
