//
//  Threeman.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import Foundation

class Threeman: DrinkingGame {
    var threeman: Player?
    
    init() {
        let name = "Triman"
        let description = "Se juega con 2 dados. Al inicio del juego, el sistema escogerá aleatoriamente a un jugador para que este sea el Triman. El orden del juego corresponde a las manecillas del reloj."
        super.init(id: 1, name: name, description: description, minPlayers: 3)
        self.log.append(.init(text: "Juego seleccionado: \(name)."))
        
        // MARK: - Rules
        self.rules.append(
            ThreemanRule(
                id: 1,
                description: "Si los dados suman 7, el jugador de la izquierda toma un shot.",
                result: "Toma un shot el jugador a tu izquierda"
            ) { state in
                state.value.reduce(0, +) == 7
            }
        )
        self.rules.append(
            ThreemanRule(
                id: 2,
                description: "Si los dados suman 9, el jugador de la izquierda toma un shot.",
                result: "Toma un shot el jugador a tu derecha"
            ) { state in
                state.value.reduce(0, +) == 9
            }
        )
        self.rules.append(
            ThreemanRule(
                id: 3,
                description: "Si los dados suman 11, el jugador toma un shot.",
                result: "¡Tomas un shot!"
            ) { state in
                state.value.reduce(0, +) == 11
            }
        )
        self.rules.append(
            ThreemanRule(
                id: 4,
                description: "Si los dados suman 3 o contienen un 3, el triman toma un shot.",
                result: "¡Toma el Triman!"
            ) { state in
                state.value.reduce(0, +) == 33 || state.value.contains(3)
            }
        )
    }
    
    override func start() {
        log.append(.init(text: "Iniciando sesión en el sistema..."))
        log.append(.init(text: "Eligiendo aleatoriamente un triman..."))
        self.threeman = self.players.randomElement()!
        self.log.append(.init(text: "Triman seleccionado: \(self.threeman!.name)", level: .alert))
        self.log.append(.empty)
        self.log.append(.init(text: "\(threeman!.name), dios te ampare."))
        self.currentState = ThreemanState()
        self.currentPlayer = self.players.randomElement()!
        
        // TODO: Esto no puede estar en la version final!! Agregar metodo que permite
        //       seleccionar las posiciones de los jugadores
        for playerIndex in players.indices {
            players[playerIndex].location = playerIndex
        }
        updateRightAndLeftPlayers()
    }
    
    override func update(completion: @escaping ([DrinkingGameRule]) -> Void) {
        self.currentState?.value = [.random(in: 1...6), .random(in: 1...6)]
        var validatedRules = [DrinkingGameRule]()
        for rule in rules {
            if rule.validator(self.currentState!) {
                validatedRules.append(rule)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(validatedRules)
        }
    }
    
    override func nextTurn() {
        self.currentPlayer = self.playerToTheLeft
        updateRightAndLeftPlayers()
    }
}
