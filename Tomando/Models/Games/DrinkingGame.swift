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
    var description: String
    var players: [Player]
    var minPlayers: Int
    var currentPlayer: Player?
    var currentState: DrinkingGameState?
    var playerToTheLeft: Player?
    var playerToTheRight: Player?
    var rules: [DrinkingGameRule]
    
    init(id: Int, name: String, description: String, minPlayers: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.players = []
        self.minPlayers = minPlayers
        self.rules = []
        self.log = []
    }
    
    func add(player name: String) {
        let newPlayer = Player(id: players.count, name: name)
        players.append(newPlayer)
    }
    
    func start() -> Void { }
    
    internal func updateRightAndLeftPlayers() {
        let currentPlayerIndex = players.firstIndex(of: currentPlayer!)!
        let playerToTheLeftIndex = currentPlayerIndex > 0 ? currentPlayerIndex - 1 : players.count - 1
        self.playerToTheLeft = players[playerToTheLeftIndex]
        let playerToTheRightIndex = currentPlayerIndex < players.count - 1 ? currentPlayerIndex + 1 : 0
        self.playerToTheRight = players[playerToTheRightIndex]
    }
    
    func update(completion: @escaping ([DrinkingGameRule]) -> Void) -> Void { }
    
    func nextTurn() -> Void { }
}

extension DrinkingGame {
    static let disabled = DrinkingGame(
        id: -1,
        name: "Proximamente",
        description: "",
        minPlayers: -1
    )
    
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
