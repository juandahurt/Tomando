////
////  GameViewModel.swift
////  Tomando
////
////  Created by juandahurt on 9/01/21.
////

import Foundation

class GameViewModel: ObservableObject {
    @Published private(set) var game: DrinkingGame
    
    init(game: DrinkingGame) {
        self.game = game
    }
    
    var log: [Log] {
        game.log
    }
    
    var currentState: DrinkingGameState {
        game.currentState!
    }
    
    var currentPlayer: Player {
        game.currentPlayer!
    }
    
    var playerToTheLeft: Player {
        game.playerToTheLeft!
    }
    
    var playerToTheRight: Player {
        game.playerToTheRight!
    }
    
    func start() {
        game.start()
    }
    
    func updateState(completion: @escaping ([DrinkingGameRule]) -> Void) {
        game.update(completion: completion)
    }
    
    func nextTurn() {
        game.nextTurn()
    }
    
//    func next(completion: @escaping ([GameRule]) -> Void) {
//        game.next(completion: completion)
//    }
}
