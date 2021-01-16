//
//  DrinkingGameRule.swift
//  Tomando
//
//  Created by juandahurt on 9/01/21.
//

import Foundation

class DrinkingGameRule: Identifiable {
    var id: Int
    var description: String
    var validator: (DrinkingGameState) -> Bool
    var result: String
    
    init(id: Int, description: String, result: String, validator: @escaping (DrinkingGameState) -> Bool) {
        self.id = id
        self.description = description
        self.result = result
        self.validator = validator
    }
    
    func updateResult() {
        
    }
}
