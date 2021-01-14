//
//  Game.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class DrinkingGame: Identifiable, Logger, StatefulGame {
    
    static let maxPlayers = 10
    
    var log: [Log]
    
    var id: Int
    var name: String
    var players: [Player]
    var minPlayers: Int

    var rules: [DrinkingGameRule]

    var started: Bool
    var currentPlayer: Player?
    var currentState: DrinkingGameState?
    
    init(id: Int, name: String, minPlayers: Int) {
        self.id = id
        self.name = name
        self.players = []
        self.minPlayers = minPlayers
        self.rules = []
        self.log = []
        self.started = false
    }
    
    func add(player name: String) {
        let newPlayer = Player(id: players.count, name: name)
        players.append(newPlayer)
    }
    
    func start() -> Void { }
    func update() -> Void { }
    func nextTurn() -> Void { }
}

extension DrinkingGame {
    static let disabled = DrinkingGame(id: -1, name: "Proximamente", minPlayers: -1)
    
    static let games: [DrinkingGame] = [
        Threeman(),
        .disabled
    ]
}


extension DrinkingGame: Equatable {
    static func == (lhs: DrinkingGame, rhs: DrinkingGame) -> Bool {
        lhs.id == rhs.id
    }
}
