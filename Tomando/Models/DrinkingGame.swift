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
    
    init(id: Int, name: String, minPlayers: Int) {
        self.id = id
        self.name = name
        self.players = []
        self.minPlayers = minPlayers
    }
    
    func add(attendant name: String) { }
}

