//
//  GameSelectorView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct GameSelectorView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var mainViewModel = MainViewModel()
    @State var gameToShowItsRules: DrinkingGame = .disabled
    @State var showModal: Bool = false
    
    var grid: some View {
        let column = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
        
        return LazyVGrid(columns: column) {
            ForEach(mainViewModel.games) { game in
                GameCardView(game: game, isSelected: game == mainViewModel.bar.currentGame)
                    .onTapGesture {
                        if game != .disabled {
                            mainViewModel.select(game: game)
                        }
                    }
                    .onLongPressGesture {
                        if game != .disabled {
                            gameToShowItsRules = game
                            showModal = true
                        }
                    }
            }
        }
            .padding(.horizontal)
            .padding(.top, 50)
    }
    
    var gameRules: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CuteText(
                    gameToShowItsRules.description,
                    color: Color("Primary"),
                    font: Font.primary(size: 14)
                )
                    .padding(.bottom)
                CuteText(
                    "Reglas",
                    color: Color("Primary"),
                    font: Font.primary(size: 16, isBold: true)
                )
                ForEach(gameToShowItsRules.rules) { rule in
                    HStack {
                        Circle()
                            .fill(Color("Primary"))
                            .frame(width: 5, height: 5)
                        CuteText(
                            rule.description,
                            color: Color("Primary"),
                            font: Font.primary(size: 14)
                        )
                    }
                }
                HStack(spacing: 3) {
                    CuteText(
                        "Fuente:",
                        color: Color("Primary").opacity(0.4),
                        font: Font.primary(size: 10)
                    )
                    CuteText(
                        "Wikipedia",
                        color: Color("Primary").opacity(0.4),
                        font: Font.primary(size: 10, isBold: true)
                    )
                }
                .padding(.top, 50)
            }
            .padding()
        }
    }
    
    var youCanSeeTheRulesText: some View {
        CuteText(
            "Si dejas presionado sobre un juego, puedes ver sus reglas.",
            color: Color("White-Dark").opacity(0.2),
            font: Font.primary(size: 12)
        )
            .padding(.top)
            .padding(.horizontal)
    }
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBar(
                    leading: BackButton(presentationMode: presentationMode),
                    center: CuteText("Selección de juego", font: Font.primary(size: 22, isBold: true)),
                    trailing: BackButton(presentationMode: presentationMode).hidden()
                )
                youCanSeeTheRulesText
                grid
                Spacer()
                NavigationLink(destination: PlayersView(mainViewModel: mainViewModel)) {
                    Text("Continuar")
                }
                    .isDetailLink(false)
                    .buttonStyle(
                    CutePrimaryButton(
                            mainColor: Color("Green"),
                            darkColor: Color("Green-Dark"),
                            lightColor: Color("Green-Light"),
                            font: .primary(size: 20, isBold: true),
                            disabled: mainViewModel.bar.currentGame == nil
                        )
                    )
                    .disabled(mainViewModel.bar.currentGame == nil)
                    .padding(.all, 20)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Primary"))
                .navigationBarHidden(true)
            Modal(isPresented: $showModal, size: .init(width: CGFloat.infinity, height: .infinity)) {
                VStack {
                    CuteText(
                        gameToShowItsRules.name,
                        color: Color("Primary"),
                        font: Font.primary(size: 20, isBold: true)
                    )
                        .padding(.horizontal)
                        .padding(.top)
                    Divider()
                        .background(Color("Primary").opacity(0.4))
                        .padding(0)
                        .frame(height: 1)
                    gameRules
                }
            }
        }
    }
    
    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
