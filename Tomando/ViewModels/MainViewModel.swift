//
//  File.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class MainViewModel: ObservableObject {
//    @Published private(set) var currentGame: DrinkingGame<DrinkingGameState>
//    
//    init() {
//        bar = Bar(currentGame: nil)
//    }
//    
//    var currentGame: DrinkingGame<DrinkingGameState>? {
//        currentGame
//    }
//    
    var games: [DrinkingGame] {
        [Threeman(), DrinkingGame.disabled]
    }
//    
//    var players: [Player] {
//        bar.currentGame?.players ?? []
//    }
//    
//    
//    func select(game: DrinkingGame<DrinkingGameState>) {
//        bar.select(game: game)
//    }
//    
//    func add(player: String) {
//        bar.currentGame?.add(player: player)
//    }
//    
//    func setLocation(for player: Player, at location: Int) {
//        bar.currentGame?.setLocation(for: player, at: location)
//    }
}
