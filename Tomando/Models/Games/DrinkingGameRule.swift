//
//  DrinkingGameRule.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

protocol DrinkingGameRule {
    associatedtype GameState: DrinkingGameState
    
    var validator: (GameState) -> Bool { get set }
}
