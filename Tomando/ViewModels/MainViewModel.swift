//
//  File.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published private(set) var bar: Bar
    
    init() {
        bar = Bar(currentGame: nil)
    }
    
    var currentGame: DrinkingGame? {
        bar.currentGame
    }
    
    var games: [DrinkingGame] {
        [Threeman(id: 1, name: "Three man", minPlayers: 3)]
    }
    
    var players: [Player] {
        bar.currentGame?.players ?? []
    }
    
    
    func select(game: DrinkingGame) {
        bar.select(game: game)
    }
    
    func add(player: String) {
        bar.currentGame?.add(player: player)
    }
    
    func setLocation(for player: Player, at location: Int) {
        bar.currentGame?.setLocation(for: player, at: location)
    }
}
