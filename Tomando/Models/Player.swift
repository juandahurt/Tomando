//
//  File.swift
//  Tomando
//
//  Created by juandahurt on 26/12/20.
//

import Foundation

struct Player: Identifiable {
    var id: Int
    var name: String
    var location: Int?
}

extension Player {
    static var dummy = Player(id: 1, name: "Dummy")
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
