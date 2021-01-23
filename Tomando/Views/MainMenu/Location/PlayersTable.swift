//
//  PlayersTable.swift
//  Tomando
//
//  Created by juandahurt on 17/01/21.
//

import SwiftUI

struct PlayersTable: View {
    var size: CGSize
    @ObservedObject var mainViewModel: MainViewModel
    var droppableAreas: Binding<[CGRect]>
    var showSkipButton: Bool
    var currentPlayerIndex: Binding<Int>
    
    private var center: CGPoint
    private let playersCircleRadius: Double
    private let angleBeetwenEachPlayer: Double

    init(in size: CGSize, mainViewModel: MainViewModel, droppableAreas: Binding<[CGRect]>, showSkipButton: Bool, currentPlayerIndex: Binding<Int>) {
        self.size = size
        self.mainViewModel = mainViewModel
        self.droppableAreas = droppableAreas
        self.showSkipButton = showSkipButton
        self.currentPlayerIndex = currentPlayerIndex

        // El circulo de los jugadores es más grande que el circulo principal
        self.playersCircleRadius = Double(size.width * 0.3 / 2) * 2.4
        // Angulo que separa cada posición de cada jugador
        self.angleBeetwenEachPlayer = .deg2rad(360.0 / Double(droppableAreas.wrappedValue.count))

        // Obtener el centro de la circunferencia
        self.center = .zero
        center.x = size.width / 2
        center.y = size.height / 2
    }

    func place(at index: Int) -> some View {
        var newPosition: CGPoint = .zero
        newPosition.x = CGFloat(playersCircleRadius * cos(2.0 * .pi - angleBeetwenEachPlayer * Double(index))) + center.x
        newPosition.y = CGFloat(playersCircleRadius * sin(2.0 * .pi - angleBeetwenEachPlayer * Double(index))) + center.y
        let player = mainViewModel.players.first(where: { $0.location == index })
        
        return Group {
            ZStack {
                Group {
                    if player != nil {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color("White-Dark").opacity(0.2))
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("White-Dark").opacity(0.1))
                            CuteText(
                                player!.name,
                                color: Color("White-Dark"),
                                font: .primary(size: 14)
                            )
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(
                                style: StrokeStyle(
                                    lineWidth: 2,
                                    dash: [6]
                                )
                            )
                            .foregroundColor(Color("White-Dark").opacity(0.2))
                            .overlay(
                                GeometryReader { geometry in
                                    Color.clear
                                        .onAppear {
                                            self.droppableAreas.wrappedValue[index] = geometry.frame(in: .global)
                                        }
                                }
                            )
                    }
                }
            }
            .frame(width: Responsive.redimension(60, on: .horizontal), height: Responsive.redimension(60, on: .horizontal))
            .position(newPosition)
        }
    }

    var body: some View {
        ZStack {
            ForEach(droppableAreas.wrappedValue.indices, id: \.self) { playerIndex in
                place(at: playerIndex)
            }
            Group {
                if showSkipButton {
                    Button("Omitir") {
                        mainViewModel.randomizeLocations()
                        withAnimation(Animation.easeOut) {
                            currentPlayerIndex.wrappedValue = mainViewModel.players.count
                        }
                    }
                    .buttonStyle(
                        CuteCircularButton(
                            diameter: Responsive.redimension(50, on: .horizontal),
                            yOffset: 5,
                            mainColor: Color("Blue"),
                            darkColor: Color("Blue-Dark"),
                            lightColor: Color("Blue-Light"),
                            font: .primary(size: Responsive.redimension(12, on: .vertical), isBold: true)
                        )
                    )
                }
            }
        }
        .frame(width: size.width, height: size.height)
    }
}
