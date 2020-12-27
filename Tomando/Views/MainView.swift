//
//  CodeView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct MainView<Game: DrinkingGame>: View {
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Group {
                        Spacer()
                        
                        NavigationLink(destination: GameSelectorView()) {
                            ZStack {
                                Circle()
                                    .fill(Color.accept)
                                    .frame(width: 178, height: 171)
                                Image("Play")
                                    .offset(x: 8, y: 0)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            RegularText("1.0.0", color: textColor, font: textFont)
                            Spacer()
                            RegularText("juandahurt", color: textColor, font: textFont)
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
    let textColor = Color.text.opacity(0.5)
    let textFont: Font = .primary(size: 14)
}
