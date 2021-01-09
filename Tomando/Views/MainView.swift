//
//  CodeView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Group {
                        Spacer()
                        
                        NavigationLink(destination: LoadingView(nextView: GameTerminalView(for: Threeman()))) {
                            Image("Play")
                                .offset(x: 5, y: 0)
                        }
                        .buttonStyle(CircularButton(diameter: 178, mainColor: Color("Green"), darkColor: Color("Green-Dark"), lightColor: Color("Green-Light")))
                        .animation(.none)
                        
                        Spacer()
                        
                        HStack {
                            CuteText("1.0.0", color: textColor, font: textFont)
                            Spacer()
                            CuteText("juandahurt", color: textColor, font: textFont)
                        }
                    }
                        .padding(padding)
                }
                    .navigationBarHidden(true)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.primary)
            }
        }
    }
    
    let padding = EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
    let textColor = Color.text.opacity(0.4)
    let textFont: Font = .secondary(size: 12)
}
