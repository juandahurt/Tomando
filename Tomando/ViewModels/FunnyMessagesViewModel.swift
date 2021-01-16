//
//  FunnyMessagesProvider.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import Foundation

class FunnyMessagesViewModel: ObservableObject {
    @Published private(set) var messages: [FunnyMessage]
    var messagesProvider: FunnyMessagesProvider
    
    init(players: [Player]) {
        messagesProvider = FunnyMessagesProvider(using: players)
        messages = messagesProvider.random()
    }
    
    func showMessage(at index: Int) {
        messages[index].show()
    }
    
    func hideMessage(at index: Int) {
        messages[index].hide()
    }
}
