//
//  GameSelectorView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct GameSelectorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var bar: Bar = Bar()
    @State var selectedGame: DrinkingGame? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar(presentationMode: presentationMode)
                Spacer()
                ForEach(bar.games) { game in
                    GameCardView(
                        actionWhenTouched: {
                            selectedGame = game
                        },
                        game: game,
                        selected: selectedGame?.id == game.id
                    )
                }
                Spacer()
                
                NavigationLink(destination: ParticipantsView()) {
                    ZStack {
                        Rectangle()
                            .fill(Color.accept.opacity(selectedGame == nil ? 0.35 : 1))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, maxHeight: 51)
                            .padding(eontinueButtonPadding)
                    }
                }
                .disabled(selectedGame == nil)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary)
                .navigationBarHidden(true)
        }
            .navigationBarHidden(true)
    }
    
    let eontinueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
