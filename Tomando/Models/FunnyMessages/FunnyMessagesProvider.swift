//
//  FunnyMessagesProvider.swift
//  Tomando
//
//  Created by juandahurt on 14/01/21.
//

import Foundation

struct FunnyMessagesProvider {
    var players: [Player]
    var numberOfMessages: Int
    
    init(using players: [Player]) {
        self.players = players
        self.numberOfMessages = .random(in: 1...players.count)
    }
    
    func random() -> [FunnyMessage] {
        guard players.count >= numberOfMessages else { return [] }
        
        let randomPlayers = randomElements(from: players, count: numberOfMessages)
        var randomMessages = randomElements(from: FunnyMessage.messages, count: numberOfMessages)
    
        randomMessages.insert(.bootingUp, at: 0)
        for index in 1...numberOfMessages {
            randomMessages[index].text = randomMessages[index].text.replacingOccurrences(of: "*", with: randomPlayers[index-1].name)
        }
        randomMessages.append(.ok)
        
        return randomMessages
    }
    
    private func randomElements<T: Equatable>(from array: [T], count: Int) -> [T] {
        var randomElements = [T]()
        var randomElement: T
        
        if array.count > 0 {
            while randomElements.count < count {
                randomElement = array.randomElement()!
                while randomElements.contains(where: {$0 == randomElement}) {
                    randomElement = array.randomElement()!
                }
                randomElements.append(randomElement)
            }
        }
        
        return randomElements
    }
}
