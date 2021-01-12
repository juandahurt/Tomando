//
//  Game.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class DrinkingGame: Identifiable {
    var id: Int
    var name: String
    var players: [Player]
    var minPlayers: Int

    var currentState: DrinkingGameState?
    var rules: [DrinkingGameRule]

    init(id: Int, name: String, minPlayers: Int, initialState: DrinkingGameState? = nil) {
        self.id = id
        self.name = name
        self.players = []
        self.minPlayers = minPlayers
        self.currentState = initialState
        self.rules = []
    }
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
