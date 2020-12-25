//
//  GameSelectorView.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct GameSelectorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar(presentationMode: presentationMode)
                Spacer()
                TouchableArea(action: {
                    print("asd")
                }) {
                    Rectangle()
                        .fill(Color.secondary)
                        .cornerRadius(10)
                        .frame(width: 170, height: 170)
                }
                .padding(.bottom, 20)
                TouchableArea(action: {
                    print("asd")
                }) {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.5))
                        .cornerRadius(10)
                        .frame(width: 170, height: 170)
                }
                Spacer()
                
                TouchableArea(action: {
                    
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.accept)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, maxHeight: 51)
                            .padding(linkButtonPadding)
                    }
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary)
                .navigationBarHidden(true)
        }
            .navigationBarHidden(true)
    }
    
    let linkButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
