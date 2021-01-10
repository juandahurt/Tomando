////
////  GameCard.swift
////  Tomando
////
////  Created by juandahurt on 25/12/20.
////
//
//import SwiftUI
//
//struct GameCardView: View {
//    var actionWhenTouched: () -> Void
//    var game: DrinkingGame<DrinkingGameState>
//    var selected: Bool
//    
//    var body: some View {
//        TouchableArea(action: actionWhenTouched) {
//            ZStack {
//                Rectangle()
//                    .fill(Color.secondary)
//                    .cornerRadius(10)
//                HStack {
//                    VStack {
//                        CuteText(game.name, font: Font.primary(size: 22, isBold: true))
//                        Image(game.name)
//                        Spacer()
//                        HStack(spacing: 3) {
//                            CuteText("Jugadores: ", font: Font.primary(size: 12))
//                            CuteText("\(game.minPlayers)+", font: Font.primary(size: 12, isBold: true))
//                        }
//                    }
//                        .padding()
//                    ZStack {
//                        Rectangle()
//                            .fill(Color.text)
//                            .cornerRadius(10, corners: .topRight)
//                            .cornerRadius(10, corners: .bottomRight)
//                        VStack(alignment: .leading) {
//                            CuteText("Aqui deberian ir la reglas", color: .primary)
//                        }
//                    }
//                }
//            }
//            .frame(width: UIScreen.main.bounds.width - 40, height: 265)
//        }
//        .padding(.bottom, 20)
//        .opacity(selected ? 1 : opacityWhenNotSelected)
//    }
//    
//    let opacityWhenNotSelected = 0.35
//}
