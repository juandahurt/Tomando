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
                .fill(isSelected ? color.opacity(selectedOpacity) : Color("Primary"))
                .frame(width: cardWidth, height: cardWidth)
            RoundedRectangle(cornerRadius: 15)
                .stroke(color.opacity(disabled ? disabledOpacity : opacity), lineWidth: Responsive.redimension(2, on: .horizontal))
                .frame(width: cardWidth, height: cardWidth)
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
            font: .primary(size: Responsive.redimension(10, on: .vertical), isBold: true)
        )
    }
    
    var body: some View {
        ZStack {
            card
            VStack {
                icon
                    .frame(width: Responsive.redimension(60, on: .horizontal), height: Responsive.redimension(60, on: .horizontal))
                CuteText(
                    game.name, color: color.opacity(disabled ? disabledOpacity : 1),
                    font: .primary(size: Responsive.redimension(16, on: .vertical), isBold: true)
                )
                players
            }
        }
    }
    
    let opacity: Double = 0.3
    let disabledOpacity: Double = 0.1
    let selectedOpacity: Double = 0.1
    let cardWidth = Responsive.redimension(131, on: .horizontal)
}
