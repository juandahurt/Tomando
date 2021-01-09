//
//  FunnyMessagesProvider.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import Foundation

class FunnyMessagesProvider: ObservableObject {
    @Published private(set) var messages: [FunnyMessage]
    
    init() {
        messages = FunnyMessage.messages
    }
    
    func showMessage(at index: Int) {
        messages[index].show()
    }
    
    func hideMessage(at index: Int) {
        messages[index].hide()
    }
}
