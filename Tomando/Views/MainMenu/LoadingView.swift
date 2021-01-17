//
//  LoadingView.swift
//  Tomando
//
//  Created by juandahurt on 7/01/21.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    @State private var firstVisibleMessageIndex = 0
    @State private var messageIndex = 0
    @State private var willHideMessages = false
    @State private var isLoading = true
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let terminalHeight: CGFloat = 61
    
    @StateObject private var messagesViewModel: FunnyMessagesViewModel
    
    var game: DrinkingGame
    
    init(players: [Player], game: DrinkingGame) {
        self._messagesViewModel = StateObject(wrappedValue: FunnyMessagesViewModel(players: players))
        self.game = game
    }
    
    
    // MARK: - Text
    var text: some View {
        HStack(spacing: 3) {
            CuteText("Recuerda:", color: Color.primary.opacity(0.4), font: .primary(size: 12, isBold: true))
            CuteText("Debes quedarte en la posición que escogiste", color: Color.primary.opacity(0.4), font: .primary(size: 12))
        }
        .padding(.top, 40)
    }
    
    // MARK: - Terminal
    var terminal: some View {
        ZStack {
            Rectangle()
                .fill(Color.primary)
                .frame(maxWidth: .infinity, maxHeight: terminalHeight)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 3) {
                    Group {
                        ForEach(messagesViewModel.messages) { message in
                            Group {
                                if message.isVisible {
                                    CuteText(message.text, color: Color("White-Dark"), font: .secondary(size: 10))
                                }
                            }
                        }
                    }
                    Group {
                        if messageIndex < 4 {
                            Spacer()
                        }
                    }
                }
                .padding(5)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: terminalHeight)
        }.onReceive(timer) { _ in
            if messageIndex == messagesViewModel.messages.count {
                timer.upstream.connect().cancel()
                isLoading = false
                return
            }
            
            if messageIndex == 4 {
                willHideMessages = true
            }
            
            if willHideMessages {
                messagesViewModel.hideMessage(at: firstVisibleMessageIndex)
                firstVisibleMessageIndex += 1
            }
            
            messagesViewModel.showMessage(at: messageIndex)
            
            messageIndex += 1
        }
    }
    
    // MARK: - Body
    var _body: some View {
        VStack {
            text
            Spacer()
            Loader()
            Spacer()
            terminal
        }
        .navigationBarHidden(true)
        .background(Color("White-Dark"))
    }
    
    
    @ViewBuilder
    var body: some View {
        if isLoading {
            _body
        } else {
            switch game {
            case is Threeman:
                GameTerminalView(for: game)
            default:
                EmptyView()
            }
        }
    }
}
