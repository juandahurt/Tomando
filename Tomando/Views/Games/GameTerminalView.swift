//
//  GameTerminalView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct GameTerminalView: View {
    @State var goToNextViewClicked = false
    @ObservedObject var gameViewModel: GameViewModel
    
    @State var messageIndex = -1
    @State var goToNextViewActivated = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    TODO: Mostrar todos los mensajes
    
    init(for game: DrinkingGame) {
        self.gameViewModel = GameViewModel(game: game)
    }
    
    func pickTheRightColor(for level: Log.Level) -> Color {
        switch level {
            case .alert:
                return Color("Error")
            case .warning:
                return Color("Green")
            case .info:
                return Color("White-Dark")
        }
    }
    
    var tapToStart: some View {
        let text = goToNextViewActivated ? "Toca cualquier parte de la pantalla para comenzar..." : ""
        return CuteText(
            text,
            font: Font.secondary(size: 12)
        )
    }
    
    var log: some View {
        VStack(alignment: .leading, spacing: 3) {
            ForEach(gameViewModel.log.indices, id: \.self) { index in
                Group {
                    if index <= messageIndex {
                        CuteText(
                            gameViewModel.log[index].text,
                            color: pickTheRightColor(for: gameViewModel.log[index].level),
                            font: Font.secondary(size: 12)
                        )
                    }
                }
            }
            tapToStart
        }
        .padding()
    }
    
    var _body: some View {
        GameBoard(
            title: "",
            disabled: true,
            mainButtonIsDisabled: true,
            mainButtonText: "",
            mainButtonAction: {}
        ) {
            log
        }
        .onTapGesture {
            if goToNextViewActivated {
                goToNextViewClicked = true
            }
        }
        .onAppear() {
            gameViewModel.objectWillChange.send()
            gameViewModel.start()
        }
        .onReceive(timer) { _ in
            messageIndex += 1
            if messageIndex == gameViewModel.log.count {
                timer.upstream.connect().cancel()
                goToNextViewActivated = true
            }
        }
    }
    
    @ViewBuilder
    var body: some View {
        if goToNextViewClicked {
            switch gameViewModel.game {
                case is Threeman:
                    ThreemanView(gameViewModel: gameViewModel)
                default:
                    EmptyView()
                }
        } else {
            _body
        }
    }
    
    let backgroundColor = Color("Primary")
    let disabledColor = Color("White-Dark").opacity(0.1)
}
