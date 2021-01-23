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
            .padding(.top, Responsive.redimension(50, on: .vertical))
    }
    
    var gameRules: some View {
        VStack {
            ScrollView {
                CuteText(
                    gameToShowItsRules.description,
                    color: Color("Primary"),
                    font: Font.primary(size: Responsive.redimension(14, on: .vertical))
                )
                HStack(spacing: 3) {
                    CuteText(
                        "Jugadores:",
                        color: Color("Primary"),
                        font: Font.primary(size: Responsive.redimension(12, on: .vertical))
                    )
                    CuteText(
                        "\(gameToShowItsRules.minPlayers)+",
                        color: Color("Primary"),
                        font: Font.primary(size: Responsive.redimension(12, on: .vertical), isBold: true)
                    )
                    Spacer()
                }
                    .padding()
                VStack(alignment: .leading) {
                    CuteText(
                        "Reglas",
                        color: Color("Primary"),
                        font: Font.primary(size: Responsive.redimension(16, on: .vertical), isBold: true)
                    )
                    ForEach(gameToShowItsRules.rules) { rule in
                        HStack {
                            Circle()
                                .fill(Color("Primary"))
                                .frame(width: Responsive.redimension(5, on: .horizontal), height: Responsive.redimension(5, on: .horizontal))
                            CuteText(
                                rule.description,
                                color: Color("Primary"),
                                font: Font.primary(size: Responsive.redimension(14, on: .vertical))
                            )
                        }
                    }
                }
            }
                .padding(15)
            Spacer()
            HStack(spacing: 3) {
                CuteText(
                    "Fuente:",
                    color: Color("Primary").opacity(0.4),
                    font: Font.primary(size: Responsive.redimension(10, on: .vertical))
                )
                CuteText(
                    "Wikipedia",
                    color: Color("Primary").opacity(0.4),
                    font: Font.primary(size: Responsive.redimension(10, on: .vertical), isBold: true)
                )
            }
        }
    }
    
    var youCanSeeTheRulesText: some View {
        CuteText(
            "Si dejas presionado sobre un juego, puedes ver sus reglas.",
            color: Color("White-Dark").opacity(0.6),
            font: Font.primary(size: Responsive.redimension(12, on: .vertical))
        )
            .padding(.top)
            .padding(.horizontal)
    }
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBar(
                    leading: BackButton(presentationMode: presentationMode),
                    center: CuteText("Selección de juego", font: Font.primary(size: Responsive.redimension(22, on: .vertical), isBold: true)),
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
                            font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true),
                            disabled: mainViewModel.bar.currentGame == nil
                        )
                    )
                    .disabled(mainViewModel.bar.currentGame == nil)
                    .padding(.all, Responsive.redimension(20, on: .horizontal))
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Primary"))
                .navigationBarHidden(true)
            Modal(isPresented: $showModal, size: .init(width: CGFloat.infinity, height: .infinity)) {
                VStack {
                    CuteText(
                        gameToShowItsRules.name,
                        color: Color("Primary"),
                        font: Font.primary(size: Responsive.redimension(20, on: .vertical), isBold: true)
                    )
                        .padding(.horizontal)
                        .padding(.top)
                    gameRules
                }
            }
        }
        .onAppear {
            mainViewModel.reset()
        }
    }
    
    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
