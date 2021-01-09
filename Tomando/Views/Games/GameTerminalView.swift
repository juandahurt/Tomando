//
//  GameTerminalView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct GameTerminalView: View {
    var game: DrinkingGame
    
    @State var goToNextViewClicked = false
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    TODO: Mostrar todos los mensajes
    
    init(for game: DrinkingGame) {
        self.game = game
    }
    
    var _body: some View {
        VStack {
            Rectangle()
                .fill(disabledColor)
                .frame(width: 144, height: 22)
                .padding(.top, 55)
            ZStack {
                Rectangle()
                    .fill(disabledColor)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                GeometryReader { _ in
                    VStack(alignment: .leading) {
                        CuteText("Toca en cualquier parte de la pantalla para comenzar...", color: .white, font: .secondary(size: 10))
                    }
                    .padding()
//                        .onReceive(timer) { _ in
//                            print("holi")
//                        }
                }
            }
                .padding(.top, 26)
                .padding(.horizontal, 15)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 3) {
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 56, height: 9)
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 31, height: 9)
                }
                    .padding(.bottom, 15)
                Spacer()
                Circle()
                    .fill(disabledColor)
                    .frame(width: 78, height: 78)
                    .padding(.vertical, 20)
                Spacer()
                VStack(alignment: .trailing, spacing: 3) {
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 56, height: 9)
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 31, height: 9)
                }
                    .padding(.bottom, 15)
            }
            .padding(.horizontal, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .onTapGesture {
            goToNextViewClicked = true
        }
    }
    
    @ViewBuilder
    var body: some View {
        if goToNextViewClicked {
            ThreemanView()
        } else {
            _body
        }
    }
    
    let backgroundColor = Color("Primary")
    let disabledColor = Color("White-Dark").opacity(0.1)
}
//
//struct GamerTerminalViewPreview: PreviewProvider {
//    static var previews: some View {
//        GameTerminalView(for: Threeman(id: 1, name: "Three man", minPlayers: 0))
//            .accentColor(Color("Primary"))
//    }
//}
