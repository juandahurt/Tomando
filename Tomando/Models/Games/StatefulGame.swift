//
//  StatefulGame.swift
//  Tomando
//
//  Created by juandahurt on 14/01/21.
//

import Foundation

protocol StatefulGame {
    var started: Bool { get }
    var currentState: DrinkingGameState? { get }
    var currentPlayer: Player? { get }
    
    func start() -> Void
    func update() -> Void
    func nextTurn() -> Void
}
