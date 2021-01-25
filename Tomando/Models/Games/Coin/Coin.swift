//
//  Coin.swift
//  Putis
//
//  Created by juandahurt on 23/01/21.
//

import Foundation

class Coin: DrinkingGame {
    enum Face {
        case heads
        case tails
    }
    
    
    init() {
        super.init(id: 2, name: "Moneda", description: "Juego que consiste en...", minPlayers: 2)
    }
}
