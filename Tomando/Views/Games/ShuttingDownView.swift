//
//  ShuttingDownView.swift
//  Tomando
//
//  Created by juandahurt on 18/01/21.
//

import SwiftUI

struct ShuttingDownView: View {
    @EnvironmentObject var appState: AppState
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let messages: [String] = [
        "Analizando mas información innecesaria...",
        "Cerrando sesión...",
        "Apagando el sistema...",
        "",
        "Chao."
    ]
    @State private var messageIndex = -1
    
    var body: some View {
        GameBoard(
            title: "",
            disabled: true,
            mainButtonIsDisabled: true,
            mainButtonText: "",
            mainButtonAction: {}
        ) {
            VStack(alignment: .leading) {
                ForEach(messages.indices, id: \.self) { index in
                    Group {
                        if index <= messageIndex {
                            CuteText(
                                messages[index],
                                color: Color("White-Dark"),
                                font: Font.secondary(size: 12)
                            )
                        }
                    }
                }
            }
            .padding()
        }
        .onReceive(timer) { _ in
            messageIndex += 1
            if messageIndex == messages.count {
                timer.upstream.connect().cancel()
                appState.moveToMainMenu = true
            }
        }
    }
}
