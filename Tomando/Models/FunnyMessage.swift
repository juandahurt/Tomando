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
    static var messages: [FunnyMessage] = [
        FunnyMessage(id: 1, text: "Esperando a que Mix termine de vomitar..."),
//        FunnyMessage(id: 2, text: "Analizando el nivel de alcochol de Abuelo..."),
//        FunnyMessage(id: 3, text: "Esperando a que Realpe deje de llorar..."),
//        FunnyMessage(id: 4, text: "Analizando "),
//        FunnyMessage(id: 5, text: "Analizando el nivel de alcochol de Abuelo"),
//        FunnyMessage(id: 6, text: "Analizando el nivel de alcochol de Abuelo"),
//        FunnyMessage(id: 7, text: "Analizando el nivel de alcochol de Abuelo"),
//        FunnyMessage(id: 8, text: "Analizando el nivel de alcochol de Abuelo")
    ]
}
