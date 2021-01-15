//
//  StatefulGame.swift
//  Tomando
//
//  Created by juandahurt on 14/01/21.
//

import Foundation

protocol StatefulGame {
    var currentState: DrinkingGameState? { get }
    var currentPlayer: Player? { get set }
    var playerToTheLeft: Player? { get set }
    var playerToTheRight: Player? { get set }
    var rules: [DrinkingGameRule] { get }
    
    func start() -> Void
    func updateRightAndLeftPlayers() -> Void
    func update(completion: @escaping ([DrinkingGameRule]) -> Void) -> Void
    func nextTurn() -> Void
}
