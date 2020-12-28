//
//  Threeman.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class Threeman: DrinkingGame {
    override init(id: Int, name: String, minPlayers: Int) {
        super.init(id: id, name: name, minPlayers: minPlayers)
        self.add(player: "Micho")
        self.add(player: "Realpe")
        self.add(player: "Abuelo")
        self.add(player: "Abuelo")
        self.add(player: "Abuelo")
        self.add(player: "Abuelo")
    }
}
