//
//  Logger.swift
//  Tomando
//
//  Created by juandahurt on 14/01/21.
//

import Foundation

protocol Logger {
    var log: [Log] { get set }
}

struct Log {
    var text: String
    var level: Level
    
    enum Level {
        case info, alert, warning
    }
    
    init(text: String, level: Level = .info) {
        self.text = text
        self.level = level
    }
}

extension Log {
    static let empty = Log(text: " ")
}
