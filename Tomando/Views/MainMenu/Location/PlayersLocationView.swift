//
//  PlayersLocation.swift
//  Tomando
//
//  Created by juandahurt on 27/12/20.
//

import SwiftUI

struct PlayersLocationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var mainViewModel: MainViewModel
    @State var selectedPlayer: Player?
    @State var cardOffset: CGSize = .zero
    @State var droppableAreas: [CGRect] = []
    @State var currentPlayer: Player?
    @State var currentPlayerIndex: Int = 0
    
    
    var playerContainer: some View {
        Group {
            if currentPlayerIndex < mainViewModel.players.count {
                VStack {
                    CuteText(
                        currentPlayer == nil ? "" : "¿Cual va a ser la ubicación de \(currentPlayer!.name)?",
                        color: Color("White-Dark"),
                        font: .primary(size: 16, isBold: true)
                    )
                        .padding(.horizontal, 20)
                        .transition(.slide)
                        .animation(.easeInOut)
                        .id("CurrentPlayer \(currentPlayer?.name ?? "")")
                    DraggableContainer(onDrop: { value in
                        if let areaIndex = droppableAreas.firstIndex(where: { $0.contains(value.location) }) {
                            mainViewModel.objectWillChange.send()
                            mainViewModel.setLocation(for: currentPlayer!, at: areaIndex)
                            withAnimation(Animation.easeInOut.delay(0.2)) {
                                currentPlayerIndex += 1
                            }
                            if currentPlayerIndex < mainViewModel.players.count {
                                currentPlayer = mainViewModel.players[currentPlayerIndex]
                            }
                        }
                    }) {
                        ZStack {
                            Group {
                                if currentPlayer == nil {
                                    EmptyView()
                                } else {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(fillColor)
                                        .frame(width: Responsive.redimension(60, on: .horizontal), height: Responsive.redimension(60, on: .horizontal))
                                    CuteText(currentPlayer!.name, font: .primary(size: Responsive.redimension(14, on: .vertical)))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            NavigationBar(
                leading: BackButton(presentationMode: presentationMode),
                center: CuteText("Ubicación", font: Font.primary(size: Responsive.redimension(22, on: .vertical), isBold: true)),
                trailing: BackButton(presentationMode: presentationMode).hidden()
            )
            Group {
                if currentPlayerIndex < mainViewModel.players.count {
                    CuteText(
                        "Arrastra el jugador a la ubicación que desees",
                        color: Color("White-Dark").opacity(0.5),
                        font: .primary(size: Responsive.redimension(12, on: .vertical)))
                    .padding(.leading)
                }
            }
            Spacer()
            GeometryReader { geometry in
                PlayersTable(
                    in: geometry.size,
                    mainViewModel: mainViewModel,
                    droppableAreas: $droppableAreas,
                    showSkipButton: currentPlayerIndex < mainViewModel.players.count,
                    currentPlayerIndex: $currentPlayerIndex
                )
            }
            Spacer(minLength: 0)
            playerContainer
            NavigationLink(destination: LoadingView(players: mainViewModel.players, game: mainViewModel.currentGame!)) {
                Text("Continuar")
            }
            .disabled(currentPlayerIndex < mainViewModel.players.count)
            .buttonStyle(
                CutePrimaryButton(
                    mainColor: Color("Green"),
                    darkColor: Color("Green-Dark"),
                    lightColor: Color("Green-Light"),
                    font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true),
                    disabled: currentPlayerIndex < mainViewModel.players.count
                )
            )
            .padding(Responsive.redimension(20, on: .horizontal))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary)
        .navigationBarHidden(true)
        .onAppear {
            self.currentPlayer = mainViewModel.players[0]
            droppableAreas = [CGRect](repeating: .zero, count: mainViewModel.players.count)
            mainViewModel.initLocations()
        }
    }
    
    let fillColor = Color("White-Dark").opacity(0.2)
    let strokeColor = Color("White-Dark").opacity(0.1)
}
