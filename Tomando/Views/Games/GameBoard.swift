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
    
    @State private var shutDown = false
    
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
                    .frame(width: 144, height: Responsive.redimension(22, on: .vertical))
                    .padding(disabled ? .top : .all, disabled ? Responsive.redimension(70, on: .vertical) : 0)
            } else {
                CuteText(title, color: textColor, font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true))
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
                        .frame(width: 56, height: Responsive.redimension(9, on: .vertical))
                    Rectangle()
                        .fill(disabledColor)
                        .frame(width: 31, height: Responsive.redimension(9, on: .vertical))
                } else {
                    CuteText(playerTitle, color: textColor, font: .primary(size: Responsive.redimension(10, on: .vertical)))
                    CuteText(player.name, color: textColor, font: .primary(size: Responsive.redimension(10, on: .vertical), isBold: true))
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
                diameter: Responsive.redimension(78, on: .horizontal),
                yOffset: Responsive.redimension(5, on: .vertical),
                mainColor: Color("Blue"),
                darkColor: Color("Blue-Dark"),
                lightColor: Color("Blue-Light"),
                font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true),
                disabled: mainButtonIsDisabled
            )
        )
        .disabled(mainButtonIsDisabled)
    }
    
    
//  MARK: - Navigation Bar
    var navigationBar: some View {
        Group {
            if disabled {
                EmptyView()
            } else {
                NavigationBar(
                    leading: EmptyView(),
                    center: EmptyView(),
                    trailing: Button(action: { shutDown = true }) {
                        Image("Power")
                            .resizable()
                            .frame(width: Responsive.redimension(20, on: .horizontal), height: Responsive.redimension(20, on: .horizontal))
                    }
                    .buttonStyle(
                        CuteCircularButton(
                            diameter: Responsive.redimension(40, on: .horizontal),
                            yOffset: Responsive.redimension(3, on: .vertical),
                            mainColor: Color("Error"),
                            darkColor: Color("Error-Dark"),
                            lightColor: Color("Error-Light")
                        )
                    )
                )
                .padding(.top, Responsive.redimension(10, on: .vertical))
            }
        }
    }
    
//  MARK: - Body
    var _body: some View {
        VStack {
            navigationBar
            titleContainer
            ZStack {
                Rectangle()
                    .fill(disabled ? disabledColor : Color.clear)
                    .cornerRadius(15)
                GeometryReader { _ in
                    content
                }
            }
                .padding(.top, Responsive.redimension(26, on: .vertical))
                .padding(.horizontal, Responsive.redimension(15, on: .horizontal))
            HStack(alignment: .bottom) {
                container(for: leftPlayer, locatedAt: .left)
                    .padding(.bottom, Responsive.redimension(15, on: .vertical))
                Spacer()
                mainButton
                    .padding(.vertical, Responsive.redimension(10, on: .vertical))
                Spacer()
                container(for: rightPlayer, locatedAt: .right)
                    .padding(.bottom, Responsive.redimension(15, on: .vertical))
            }
            .padding(.horizontal, Responsive.redimension(20, on: .horizontal))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
    
    @ViewBuilder
    var body: some View {
        if shutDown {
            ShuttingDownView()
        } else {
            _body
        }
    }
    
    let backgroundColor = Color("Primary")
    let textColor = Color("White-Dark")
    let disabledColor = Color("White-Dark").opacity(0.1)
}
