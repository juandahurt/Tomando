//
//  GameViewModel.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

class GameViewModel<Game: DrinkingGame<GameState, GameRule>, GameState: DrinkingGameState, GameRule: DrinkingGameRule>: ObservableObject {
    @Published private(set) var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var currentState: GameState {
        game.currentState
    }
    
    func start() {
        game.start()
    }
    
    func next(completion: @escaping ([GameRule]) -> Void) {
        game.next(completion: completion)
    }
}
