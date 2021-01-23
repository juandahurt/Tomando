//
//  CodeView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState
    @State var rootIsActive = false
    @State var creditsIsActive = false
    @State private var yOffset: CGFloat = 5
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack(spacing: Responsive.redimension(15, on: .vertical)) {
                Spacer()
                Group {
                    Image("Putis")
                        .padding(.bottom, logoHPadding)
                        .offset(x: 0, y: yOffset)
                    NavigationLink(
                        destination: GameSelectorView(),
                        isActive: $rootIsActive
                    ) {
                        Text("Empezar")
                    }
                    .isDetailLink(false)
                    .buttonStyle(
                        CutePrimaryButton(
                            mainColor: Color("Green"),
                            darkColor: Color("Green-Dark"),
                            lightColor: Color("Green-Light"),
                            font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true)
                        )
                    )
                    .animation(.none)
                    
                    NavigationLink(
                        destination: CreditsView(),
                        isActive: $creditsIsActive
                    ) {
                        Text("Créditos")
                    }
                    .isDetailLink(false)
                    .buttonStyle(
                        CuteSecondaryButton(
                            font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true)
                        )
                    )
                }
                .padding(.top)
                .padding(.horizontal, mainHPadding)
                
                Spacer()
                
                HStack {
                    CuteText("1.0.1", color: textColor, font: textFont)
                    Spacer()
                    CuteText("juandahurt", color: textColor, font: textFont)
                }
                .padding(bottomTextPadding)
            }
                .navigationBarHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary)
            .onReceive(self.appState.$moveToMainMenu) { moveToMainMenu in
                if moveToMainMenu {
                    self.rootIsActive = false
                    self.appState.moveToMainMenu = false
                }
            }
        }
        .onReceive(timer) { _ in
            if !rootIsActive && !creditsIsActive {
                withAnimation(Animation.easeInOut(duration: 1).speed(0.5)) {
                    yOffset *= -1
                }
            }
        }
    }
    
    let textColor = Color("White-Dark").opacity(0.2)
    let textFont: Font = .secondary(size: Responsive.redimension(12, on: .vertical))
    
    private let logoHPadding: CGFloat = Responsive.redimension(35, on: .horizontal)
    private let mainHPadding: CGFloat = Responsive.redimension(50, on: .horizontal)
    private var bottomTextPadding: CGFloat = Responsive.redimension(13, on: .vertical)
}
