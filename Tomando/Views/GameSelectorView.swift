//
//  GameSelectorView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct GameSelectorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar(
                    leading: BackButton(presentationMode: presentationMode),
                    trailing: BackButton(presentationMode: presentationMode).hidden()
                )
                Spacer()
                ForEach(mainViewModel.games) { game in
                    GameCardView(
                        actionWhenTouched: {
                            mainViewModel.select(game: game)
                        },
                        game: game,
                        selected: mainViewModel.currentGame?.id == game.id
                    )
                }
                Spacer()
                
                NavigationLink(destination: AttendantsView(mainViewModel: mainViewModel)) {
                    DisabableArea(isDisabled: mainViewModel.currentGame == nil) {
                        ZStack {
                            Rectangle()
                                .fill(Color.accept)
                            RegularText("Continuar")
                        }
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .padding(continueButtonPadding)
                    }
                }
                .disabled(mainViewModel.currentGame == nil)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary)
                .navigationBarHidden(true)
        }
            .navigationBarHidden(true)
    }
    
    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
