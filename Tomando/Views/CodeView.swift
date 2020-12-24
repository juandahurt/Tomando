//
//  CodeView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct CodeView: View {
    @State var gameCode: String = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Spacer()
                    
                    TextField("Código", text: $gameCode)
                        .textFieldStyle(FunnyTextField())
                        .padding(.horizontal, padding)
                        .textCase(.uppercase)
                        .autocapitalization(.allCharacters)
                    RealisticButton(
                        "Continuar",
                        backgroundColor: Color.secondary,
                        isDisabled: gameCode.isEmpty
                    )
                    .textCase(.uppercase)
                        .padding(.horizontal, padding)
                        .disabled(gameCode.isEmpty)
                    
                    Spacer()
                    RegularText(
                        "¿No tenés un código?",
                        color: Color.text.opacity(0.5),
                        font: .primary(size: 14)
                    )
                    NavigationLink(destination: GameSelectorView()) {
                        RegularText(
                            "Creá una nueva partida aquí",
                            color: .secondary,
                            font: .primary(size: 14)
                        )
                        .padding(.bottom)
                    }
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.primary)
            }
        }
    }
    
    var padding: CGFloat = 50
}
