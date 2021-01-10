//
//  GameTerminalView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct GameTerminalView<Game: DrinkingGame<GameState, GameRule>, GameState: DrinkingGameState, GameRule: DrinkingGameRule>: View {
    var game: Game
    
    @State var goToNextViewClicked = false
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    TODO: Mostrar todos los mensajes
    
    init(for game: Game) {
        self.game = game
    }
    
    var _body: some View {
        GameBoard(
            disabled: true,
            mainButtonIsDisabled: true,
            mainButtonText: "",
            mainButtonAction: {}) {
            VStack(alignment: .leading) {
                CuteText("Toca cualquier parte de la pantalla para comenzar...", font: Font.secondary(size: 12))
            }
            .padding()
        }
        .onTapGesture {
            goToNextViewClicked = true
        }
    }
    
    @ViewBuilder
    var body: some View {
        if goToNextViewClicked {
            ThreemanView()
        } else {
            _body
        }
    }
    
    let backgroundColor = Color("Primary")
    let disabledColor = Color("White-Dark").opacity(0.1)
}
