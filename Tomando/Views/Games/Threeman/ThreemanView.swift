//
//  ThreemanView.swift
//  Tomando
//
//  Created by juandahurt on 8/01/21.
//

import SwiftUI

struct ThreemanView: View {
    
    var playArea: some View {
        HStack(spacing: 37) {
            Dice(facing: 2)
            Dice(facing: 1)
        }
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(disabledColor)
                .frame(width: 144, height: 22)
                .padding(.top, 55)
            ZStack {
                Rectangle()
                    .fill(disabledColor)
                    .cornerRadius(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                playArea
            }
                .padding(.top, 26)
                .padding(.horizontal, 15)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 3) {
                    CuteText("A tu izquierda", color: .white, font: .primary(size: 10))
                    CuteText("Realpe", color: .white, font: .primary(size: 10, isBold: true))
                }
                    .padding(.bottom, 15)
                Spacer()
                Circle()
                    .fill(disabledColor)
                    .frame(width: 78, height: 78)
                    .padding(.vertical, 20)
                Spacer()
                VStack(alignment: .trailing, spacing: 3) {
                    CuteText("A tu derecha", color: .white, font: .primary(size: 10))
                    CuteText("Mix", color: .error, font: .primary(size: 10, isBold: true))
                }
                    .padding(.bottom, 15)
            }
            .padding(.horizontal, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
    
    
    let backgroundColor = Color("Primary")
    let disabledColor = Color("White-Dark").opacity(0.1)
}

struct preview: PreviewProvider {
    static var previews: some View {
        ThreemanView()
    }
}
