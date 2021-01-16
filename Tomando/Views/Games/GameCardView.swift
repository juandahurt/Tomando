//
//  GameCard.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct GameCardView: View {
    var game: DrinkingGame
    var disabled: Bool
    var color: Color
    var isSelected: Bool
    
    init(game: DrinkingGame, isSelected: Bool = false) {
        self.game = game
        self.disabled = game == DrinkingGame.disabled
        self.color = Color("White-Dark")
        self.isSelected = isSelected
    }
    
    var card: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(isSelected ? color.opacity(selectedOpacity) : Color.clear)
                .frame(width: 131, height: 131)
            RoundedRectangle(cornerRadius: 15)
                .stroke(color.opacity(disabled ? disabledOpacity : opacity), lineWidth: 2)
                .frame(width: 131, height: 131)
        }
    }
    
    var icon: some View {
        Group {
            if disabled {
                Circle()
                    .fill(color.opacity(disabledOpacity))
            } else {
                Image(game.name)
                    .resizable()
            }
        }
    }
    
    var players: some View {
        let text = game.minPlayers == -1 ? "?" : String(game.minPlayers) + "+"
        return CuteText(
            "Jugadores: " + text,
            color: color.opacity(disabled ? disabledOpacity : opacity),
            font: .primary(size: 10, isBold: true)
        )
    }
    
    var body: some View {
        ZStack {
            card
            VStack {
                icon
                    .frame(width: 60, height: 60)
                CuteText(
                    game.name, color: color.opacity(disabled ? disabledOpacity : 1),
                    font: .primary(size: 16, isBold: true)
                )
                players
            }
        }
    }
    
    let opacity: Double = 0.2
    let disabledOpacity: Double = 0.1
    let selectedOpacity: Double = 0.1
}
