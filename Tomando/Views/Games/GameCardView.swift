//
//  GameCard.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct GameCardView: View {
    var actionWhenTouched: () -> Void
    var game: DrinkingGame
    var selected: Bool
    
    var body: some View {
        TouchableArea(action: actionWhenTouched) {
            ZStack {
                Rectangle()
                    .fill(Color.secondary)
                    .cornerRadius(10)
                HStack {
                    VStack {
                        RegularText(game.name, font: Font.primary(size: 22))
                        Image(game.name)
                        Spacer()
                        RegularText("Jugadores: \(game.minPlayers)+", font: Font.primary(size: 12))
                            .padding(.trailing, 20)
                    }
                        .padding()
                    Rectangle()
                        .fill(Color.text)
                        .cornerRadius(10, corners: .topRight)
                        .cornerRadius(10, corners: .bottomRight)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 265)
        }
        .padding(.bottom, 20)
        .opacity(selected ? 1 : opacityWhenNotSelected)
    }
    
    let opacityWhenNotSelected = 0.35
}
