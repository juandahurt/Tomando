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
    
    func add(player name: String) {
        let id = players.count
        let newPlayer = Player(id: id, name: name)
        players.append(newPlayer)
    }
    
    func setLocation(for player: Player, at location: Int) {
        let playerIndex = self.players.firstIndex {
            $0.id == player.id
        }
        players[playerIndex!].location = location
    }
}

