//
//  GameCard.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct GameCardView<Game: DrinkingGame>: View {
    var actionWhenTouched: () -> Void
    var game: Game
    var selected: Bool
    
    var body: some View {
        TouchableArea(action: actionWhenTouched) {
            Rectangle()
                .fill(Color.secondary.opacity(selected ? 1 : opacityWhenNotSelected))
                .cornerRadius(10)
                .frame(width: 170, height: 170)
        }
        .padding(.bottom, 20)
    }
    
    let opacityWhenNotSelected = 0.35
}
