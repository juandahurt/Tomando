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
    
//    var currentState: GameState {
//        game.currentState
//    }
    
    func start() {
        game.start()
    }
    
//    func next(completion: @escaping ([GameRule]) -> Void) {
//        game.next(completion: completion)
//    }
}
