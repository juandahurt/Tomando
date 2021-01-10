//
//  GameBoard.swift
//  Tomando
//
//  Created by juandahurt on 10/01/21.
//

import SwiftUI

struct GameBoard<Content: View>: View {
    var title: String = "Titulo"
    var leftPlayer: Player = .dummy
    var rightPlayer: Player = .dummy
    
    var disabled: Bool
    
    var mainButtonIsDisabled: Bool
    var mainButtonText: String
    var mainButtonAction: () -> Void
    
    var content: Content
    
    init(disabled: Bool, mainButtonIsDisabled: Bool, mainButtonText: String, mainButtonAction: @escaping () -> Void, content: () -> Content) {
        self.disabled = disabled
        self.mainButtonIsDisabled = mainButtonIsDisabled
        self.mainButtonText = mainButtonText
        self.mainButtonAction = mainButtonAction
        self.content = content()
    }
    
//  MARK: - Title
    var titleContainer: some View {
        Group {
            if disabled {
                Rectangle()
                    .fill(disabledColor)
                    .frame(width: 144, height: 22)
            } else {
                CuteText("Abuelo, tú empiezas", color: .white, font: .primary(size: 20))
            }
        }
    }

//  MARK: - Players Container
    enum PlayerLocation {
        case left, right
    }
    
    func container(for player: Player, locatedAt location: PlayerLocation) -> some View {
        let playerTitle = location == .left ? "A tu izquierda" : "A tu derecha"
        let alignment: HorizontalAlignment = location == .left ? .leading : .trailing
        
        return Group {
            VStack(alignment: alignment, spacing: 3) {
                if disabled {
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 56, height: 9)
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 31, height: 9)
                } else {
                    CuteText(playerTitle, color: .white, font: .primary(size: 10))
                    CuteText(player.name, color: .white, font: .primary(size: 10, isBold: true))
                }
            }
        }
    }
    
//  MARK: - Main Button
    var mainButton: some View {
        Button(mainButtonText) {
            mainButtonAction()
        }
        .buttonStyle(
            CircularButton(
                diameter: 78,
                yOffset: 5,
                mainColor: Color("Blue"),
                darkColor: Color("Blue-Dark"),
                lightColor: Color("Blue-Light"),
                font: .primary(size: 20, isBold: true),
                disabled: mainButtonIsDisabled
            )
        )
    }
    
//  MARK: - Body
    var body: some View {
        VStack {
            titleContainer
                .padding(.top, 55)
            ZStack {
                Rectangle()
                    .fill(disabledColor)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                GeometryReader { _ in
                    content
                }
            }
                .padding(.top, 26)
                .padding(.horizontal, 15)
            HStack(alignment: .bottom) {
                container(for: leftPlayer, locatedAt: .left)
                    .padding(.bottom, 15)
                Spacer()
                mainButton
                    .padding(.vertical, 20)
                Spacer()
                container(for: rightPlayer, locatedAt: .right)
                    .padding(.bottom, 15)
            }
            .padding(.horizontal, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
    
    let backgroundColor = Color("Primary")
    let disabledColor = Color("White-Dark").opacity(0.1)
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard(
            disabled: false,
            mainButtonIsDisabled: false,
            mainButtonText: "Texto",
            mainButtonAction: {
                print("holi")
            }) {
            VStack {
                Text("Contenido del tablero")
            }
        }
    }
}
