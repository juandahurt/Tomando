//
//  ThreemanView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct ThreemanView: View {
    @ObservedObject var gameViewModel = GameViewModel(game: Threeman())
    
    @State var title: String = "Abuelo, es tu turno"
    @State var isLoading = false
    @State var showNumber = false
    
    @State var activeRules = [ThreemanRule]()
    
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
        title = "Atentos..."
        isLoading = true
        showNumber = false
        activeRules.removeAll()
        
        gameViewModel.next() { rules in
            title = rules.count == 1 && rules[0].nextToDrink == .noOne ? ".  .  ." : "Abuelo, es tu turno"
            isLoading = false
            showNumber = true
            
            activeRules = rules
        }
    }
    
    var _body: some View {
        VStack {
            CuteText(
                showNumber ? String(gameViewModel.currentState.dices.reduce(0, +)) : "",
                color: Color("Primary").opacity(0.5),
                font: Font.primary(size: 40, isBold: true)
            )
                .padding(.vertical)
            dices
            VStack(spacing: 10) {
                Spacer()
                ForEach(activeRules) { rule in
                    CuteText(
                        rule.result,
                        color: rule.nextToDrink == .threeman ? Color("Primary") : Color.white,
                        font: Font.primary(size: 20, isBold: true)
                    )
                }
                Spacer()
            }
                .padding(.top, 47)
        }
    }
    
    var body: some View {
        GameBoard(
            title: title,
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
