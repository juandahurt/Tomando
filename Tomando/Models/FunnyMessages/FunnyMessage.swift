//
//  FunnyMessage.swift
//  Tomando
//
//  Created by juandahurt on 7/01/21.
//

import Foundation

struct FunnyMessage: Identifiable {
    var id: Int
    var text: String
    var isVisible: Bool = false
    
    mutating func show() {
        isVisible = true
    }
    
    mutating func hide() {
        isVisible = false
    }
}

extension FunnyMessage {
    static var bootingUp = FunnyMessage(id: 0, text: "Iniciando el sistema...")
    static var ok = FunnyMessage(id: .max, text: "OK")
    
    static var messages: [FunnyMessage] = [
        FunnyMessage(id: 1, text: "Esperando a que * termine de vomitar..."),
        FunnyMessage(id: 2, text: "Esperando a que * deje de llorar..."),
        FunnyMessage(id: 3, text: "Analizando nivel de alcohol de *"),
        FunnyMessage(id: 4, text: "Esperando a que * deje el celular..."),
        FunnyMessage(id: 5, text: "Verificando que * no llame a su ex..."),
        FunnyMessage(id: 6, text: "Verificando situación sentimental de *")
    ]
}

extension FunnyMessage: Equatable {
    static func == (lhs: FunnyMessage, rhs: FunnyMessage) -> Bool {
        lhs.id == rhs.id
    }
}
