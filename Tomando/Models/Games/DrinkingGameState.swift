//
//  DrinkingGameState.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

protocol DrinkingGameState {
    var action: Action { get set }
}

enum Action {
    case unknown
    case drink
    case notDrink
}
