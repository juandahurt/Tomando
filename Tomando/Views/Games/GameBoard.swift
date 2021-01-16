//
//  GameBoard.swift
//  Tomando
//
//  Created by juandahurt on 10/01/21.
//

import SwiftUI

struct GameBoard<Content: View>: View {
    var title: String
    var leftPlayer: Player = .dummy
    var rightPlayer: Player = .dummy
    
    var disabled: Bool
    
    var mainButtonIsDisabled: Bool
    var mainButtonText: String
    var mainButtonAction: () -> Void
    
    var content: Content
    
    init(title: String, leftPlayer: Player = .dummy, rightPlayer: Player = .dummy, disabled: Bool, mainButtonIsDisabled: Bool, mainButtonText: String, mainButtonAction: @escaping () -> Void, content: () -> Content) {
        self.title = title
        self.leftPlayer = leftPlayer
        self.rightPlayer = rightPlayer
        self.disabled = disabled
        self.mainButtonIsDisabled = mainButtonIsDisabled
        self.mainButtonText = mainButtonText
        self.mainButtonAction = mainButtonAction
        self.content = content()
    }
    
//  MARK: - Title
    var titleContainer: some View {
        Group {
            if disabled || title.isEmpty {
                Rectangle()
                    .fill(disabled ? disabledColor : Color.clear)
                    .frame(width: 144, height: 22)
            } else {
                CuteText(title, color: textColor, font: .primary(size: 20, isBold: true))
                    .transition(.slide)
                    .animation(Animation.easeIn.speed(2))
                    .id("Titletext" + title)
            }
        }.frame(width: UIScreen.main.bounds.width)
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
                    CuteText(playerTitle, color: textColor, font: .primary(size: 10))
                    CuteText(player.name, color: textColor, font: .primary(size: 10, isBold: true))
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
            CuteCircularButton(
                diameter: 78,
                yOffset: 5,
                mainColor: Color("Blue"),
                darkColor: Color("Blue-Dark"),
                lightColor: Color("Blue-Light"),
                font: .primary(size: 20, isBold: true),
                disabled: mainButtonIsDisabled
            )
        )
        .disabled(mainButtonIsDisabled)
    }
    
//  MARK: - Body
    var body: some View {
        VStack {
            titleContainer
                .padding(.top, 55)
            ZStack {
                Rectangle()
                    .fill(disabled ? disabledColor : color)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Rectangle()
                    .fill(disabled ? Color.clear : color)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(10)
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
    let textColor = Color("White-Dark")
    let disabledColor = Color("White-Dark").opacity(0.1)
    let color = Color("Green").opacity(0.7)
}
