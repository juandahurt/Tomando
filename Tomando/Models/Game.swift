//
//  Game.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class DrinkingGame: Identifiable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension DrinkingGame {
    static var threeman = Threeman(id: 1, name: "Threeman")
}
