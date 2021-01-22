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
    @State private var yOffset: CGFloat = 10
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("Putis")
                    .padding(.bottom, 40)
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
                        font: .primary(size: 20, isBold: true)
                    )
                )
                .padding(.horizontal, 50)
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
                        font: .primary(size: 20, isBold: true)
                    )
                )
                .padding(.horizontal, 50)
                .padding(.top)
                .animation(.none)
                
                Spacer()
                
                HStack {
                    CuteText("1.0.0", color: textColor, font: textFont)
                    Spacer()
                    CuteText("juandahurt", color: textColor, font: textFont)
                }
            }
                .padding(padding)
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
    
    let padding = EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
    let textColor = Color("White-Dark").opacity(0.2)
    let textFont: Font = .secondary(size: 12)
}
