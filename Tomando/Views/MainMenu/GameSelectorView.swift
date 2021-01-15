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
            }
        }
            .padding(.horizontal)
            .padding(.top, 50)
    }
    
    var body: some View {
        VStack {
            NavigationBar(
                leading: BackButton(presentationMode: presentationMode),
                center: CuteText("Selección de juego", font: Font.primary(size: 22, isBold: true)),
                trailing: BackButton(presentationMode: presentationMode).hidden()
            )
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
    }
    
    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
