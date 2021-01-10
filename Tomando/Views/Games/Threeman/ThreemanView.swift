//
//  ThreemanView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct ThreemanView: View {
    @ObservedObject var gameViewModel = GameViewModel(game: Threeman())
    
    @State var isLoading = false
    
    init() {
        gameViewModel.start()
    }
    
    var dices: some View {
        Group {
            if isLoading {
                Loader(
                    color: .white,
                    lightColor: Color.gray.opacity(0.1)
                )
            } else {
                HStack(spacing: 37) {
                    Spacer()
                    Dice(facing: gameViewModel.currentState.dices[0])
                    Dice(facing: gameViewModel.currentState.dices[1])
                    Spacer()
                }
            }
        }
    }
    
    func mainButtonAction() {
        isLoading = true
        gameViewModel.next() {
            isLoading = false
        }
    }
    
    var _body: some View {
        VStack {
            Spacer()
            dices
            Spacer()
        }
    }
    
    var body: some View {
        GameBoard(
            disabled: false,
            mainButtonIsDisabled: isLoading,
            mainButtonText: "Rodar",
            mainButtonAction: mainButtonAction) {
            _body
        }
    }
    
    
    let backgroundColor = Color("Primary")
    let disabledColor = Color("White-Dark").opacity(0.1)
}
