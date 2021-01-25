//
//  CoinView.swift
//  Putis
//
//  Created by juandahurt on 24/01/21.
//

import SwiftUI

struct CoinView: View {
    @ObservedObject var gameViewModel: GameViewModel
    @State var numberOfShots: Int = 1
    @State var selectedFace: Coin.Face?
    
    func coin(face: Coin.Face) -> some View {
        let imgName = face == .heads ? "Heads" : "Tails"
        let strokeContainerOpacity = selectedFace == face ? 0.2 : 0
        let fillContainerOpacity = selectedFace == face ? 0.1 : 0
        return ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("White-Dark").opacity(strokeContainerOpacity), lineWidth: Responsive.redimension(2, on: .horizontal))
                .frame(width: Responsive.redimension(120, on: .horizontal), height: Responsive.redimension(120, on: .horizontal))
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("White-Dark").opacity(fillContainerOpacity))
                .frame(width: Responsive.redimension(120, on: .horizontal), height: Responsive.redimension(120, on: .horizontal))
            Image(imgName)
                .resizable()
                .frame(width: Responsive.redimension(100, on: .horizontal), height: Responsive.redimension(100, on: .horizontal))
                .onTapGesture {
                    selectedFace = face
                }
        }
    }
    
    func text() -> some View {
        var faceStr = ""
        if let face = selectedFace {
            faceStr = face == .heads ? "Cara" : "Cruz"
        }
        let text = selectedFace == nil ? "Selecciona alguna de las caras" : "Has seleccionado: \(faceStr)"
        
        return CuteText(text, font: .primary(size: Responsive.redimension(16, on: .vertical), isBold: true))
    }
    
    var coinsArea: some View {
        Group {
            text()
            HStack(spacing: Responsive.redimension(35, on: .horizontal)) {
                coin(face: .heads)
                coin(face: .tails)
            }
        }
        .padding(.top, Responsive.redimension(20, on: .vertical))
    }
    
    var shotsArea: some View {
        VStack {
            Glass(number: $numberOfShots)
            HStack(spacing: Responsive.redimension(41, on: .horizontal)) {
                Button("-") {
                    withAnimation(.easeOut) {
                        if numberOfShots > 1 {
                            numberOfShots -= 1
                        }
                    }
                }
                    .buttonStyle(
                        CuteCircularButton(
                            diameter: Responsive.redimension(60, on: .horizontal),
                            yOffset: Responsive.redimension(5, on: .vertical),
                            mainColor: Color("White-Dark"),
                            darkColor: Color("Gray"),
                            lightColor: .white,
                            font: .primary(size: Responsive.redimension(50, on: .vertical))
                        )
                    )
                Button("+") {
                    withAnimation(.easeIn) {
                        numberOfShots += 1
                    }
                }
                    .buttonStyle(
                        CuteCircularButton(
                            diameter: Responsive.redimension(60, on: .horizontal),
                            yOffset: Responsive.redimension(6, on: .vertical),
                            mainColor: Color("White-Dark"),
                            darkColor: Color("Gray"),
                            lightColor: .white,
                            font: .primary(size: Responsive.redimension(50, on: .vertical))
                        )
                    )
            }
            .padding(.vertical, Responsive.redimension(10, on: .vertical))
        }
    }
    
    var _body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Green").opacity(0.7))
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Green").opacity(0.7))
                .padding(Responsive.redimension(10, on: .horizontal))
            VStack {
                shotsArea
                coinsArea
            }
        }
    }
    
    var body: some View {
        GameBoard(
            title: "titulo",
            disabled: false,
            mainButtonIsDisabled: false,
            mainButtonText: "OK",
            mainButtonAction: { }) {
            _body
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        CoinView(gameViewModel: GameViewModel(game: Coin()))
    }
}
