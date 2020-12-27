//
//  Threeman.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class Threeman: DrinkingGame {
    override func add(attendant name: String) {
        let id = players.count
        let newPlayer = Player(id: id, name: name)
        players.append(newPlayer)
    }
}
