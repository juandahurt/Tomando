//
//  ThreemanView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct ThreemanView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    @State var title: String = ""
    @State var isLoading = false
    @State var showNumber = false
    
    @State var activeRules = [DrinkingGameRule]()
    
    @State var mainButtonText: String = "Rodar"
    @State var mainButtonAction: () -> Void = {}
    
    
    func updateAction() {
        title = ""
        isLoading = true
        showNumber = false
        
        gameViewModel.updateState() { rules in
            title = "\(gameViewModel.currentPlayer.name) ya rodó los dados"
            isLoading = false
            showNumber = true
            mainButtonText = "OK"
            mainButtonAction = nextTurnAction
            activeRules = rules
        }
    }
    
    func nextTurnAction() {
        gameViewModel.nextTurn()
        title = "\(gameViewModel.currentPlayer.name), es tu turno"
        mainButtonText = "Rodar"
        self.mainButtonAction = updateAction
        activeRules.removeAll()
    }
    
    var dices: some View {
        Group {
            if isLoading {
                Spacer()
                Loader(
                    color: .white,
                    lightColor: Color.gray.opacity(0.1)
                )
                Spacer()
            } else {
                HStack(spacing: 37) {
                    Spacer()
                    Dice(facing: gameViewModel.currentState.value[0])
                    Dice(facing: gameViewModel.currentState.value[1])
                    Spacer()
                }
            }
        }
    }
    
    var threemanName: some View {
        Group {
            if isLoading {
                EmptyView()
            } else {
                HStack(spacing: 3) {
                    CuteText(
                        "Triman:",
                        color: Color("Primary").opacity(0.3),
                        font: Font.primary(size: 16)
                    )
                    CuteText(
                        (gameViewModel.game as! Threeman).threeman!.name,
                        color: Color("Primary").opacity(0.3),
                        font: Font.primary(size: 16, isBold: true)
                    )
                    Spacer()
                }
                .padding(30)
            }
        }
    }
    
    var rulesList: some View {
        Group {
            if isLoading {
                EmptyView()
            } else {
                VStack(spacing: 10) {
                    Spacer()
                    Group {
                        if activeRules.isEmpty && mainButtonText == "OK" {
                            CuteText(
                                "Nadie toma",
                                color: Color("Primary").opacity(0.5),
                                font: Font.primary(size: 20, isBold: true)
                            )
                        } else {
                            ForEach(activeRules) { rule in
                                CuteText(
                                    rule.result,
                                    color: Color("White-Dark"),
                                    font: Font.primary(size: 20, isBold: true)
                                )
                            }
                        }
                    }
                    Spacer()
                }
                    .padding(.top)
            }
        }
    }
    
    var _body: some View {
        ZStack {
            Rectangle()
                .fill(cardBackgroundColor)
                .cornerRadius(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            ZStack {
                Rectangle()
                    .fill(cardBackgroundColor)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(10)
                VStack {
                    threemanName
                    Spacer()
                    CuteText(
                        showNumber ? String(gameViewModel.currentState.value.reduce(0, +)) : "",
                        color: Color("Primary").opacity(0.5),
                        font: Font.primary(size: 40, isBold: true)
                    )
                        .padding(.bottom)
                    dices
                    rulesList
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            self.title = "\(gameViewModel.currentPlayer.name), es tu turno"
            self.mainButtonAction = updateAction
        }
    }
    
    var body: some View {
        GameBoard(
            title: title,
            leftPlayer: gameViewModel.playerToTheLeft,
            rightPlayer: gameViewModel.playerToTheRight,
            disabled: false,
            mainButtonIsDisabled: isLoading,
            mainButtonText: mainButtonText,
            mainButtonAction: mainButtonAction
        ) {
            _body
        }
    }
    
    
    let backgroundColor = Color("Primary")
    let cardBackgroundColor = Color("Green").opacity(0.7)
    let disabledColor = Color("White-Dark").opacity(0.1)
}
