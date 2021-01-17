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
        bar = Bar()
    }
    
    var games: [DrinkingGame] {
        DrinkingGame.games
    }
  
    var players: [Player] {
        bar.currentGame?.players ?? []
    }
    
    var currentGame: DrinkingGame? {
        bar.currentGame
    }

    func select(game: DrinkingGame) {
        bar.currentGame = game
    }
    
    func add(player name: String) {
        bar.currentGame?.add(player: name)
    }
    
    func initLocations() {
        bar.currentGame?.initLocations()
    }
    
    func setLocation(for player: Player, at location: Int) {
        bar.currentGame?.setLocation(for: player, at: location)
    }
//    
//    func setLocation(for player: Player, at location: Int) {
//        bar.currentGame?.setLocation(for: player, at: location)
//    }
}
