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
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
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
                
                NavigationLink(destination: CreditsView()) {
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
    }
    
    let padding = EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
    let textColor = Color("White-Dark").opacity(0.2)
    let textFont: Font = .secondary(size: 12)
}
