//
//  Bar.swift
//  Tomando
//
//  Created by juandahurt on 26/12/20.
//

import Foundation

struct Bar {
    private(set) var currentGame: DrinkingGame?
    
    mutating func select(game: DrinkingGame) {
        currentGame = game
    }
}
