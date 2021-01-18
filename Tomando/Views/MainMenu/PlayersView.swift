//
//  ParticipantsView.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

// TODO: Al volver a la pantalla anterior y regresar, la comparacion para saber si
//       el usuario puede continuar no funciona!

struct PlayersView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var mainViewModel: MainViewModel
    @State private var playerName: String = ""
    @State private var percentage: Double = 0
    @State private var barColor = Color("Error")
    
    
    func updateBarPercentage() -> Void {
        if let game = self.mainViewModel.bar.currentGame {
            self.percentage = Double(game.players.count) / Double(DrinkingGame.maxPlayers)
        }
    }
    
    func updateBarColor() -> Void {
        let playersCount = mainViewModel.bar.currentGame?.players.count
        let minPlayers = mainViewModel.bar.currentGame?.minPlayers
        if playersCount! >= minPlayers! {
            barColor = Color("Green")
        }
    }
    
//  MARK: - Player container
    func container(for player: Player) -> some View {
        VStack {
            HStack {
                CuteText(player.name, color: Color("White-Dark").opacity(0.4), font: .primary(size: 16))
                Spacer()
                
            }
            .padding(.vertical)
            Divider()
                .background(Color("White-Dark").opacity(0.2))
        }
        .padding(.horizontal)
    }
    
//  MARK: - Players
    var players: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("White-Dark").opacity(0.1), lineWidth: 2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            ScrollView {
                VStack {
                    ForEach(mainViewModel.players) { player in
                        container(for: player)
                    }
                    Spacer(minLength: 0)
                }
            }
            .padding(.top, 5)
        }
        .padding(.all, 20)
    }
    
//  MARK: - Form
    var form: some View {
        VStack(alignment: .leading, spacing: 2) {
            CuteText("Nombre", color: Color("White-Dark").opacity(0.2), font: Font.primary(size: 16, isBold: true))
            HStack {
                TextField("", text: $playerName)
                    .textFieldStyle(CuteTextField(width: 212))
                    .textCase(.lowercase)
                Button("Agregar") {
                    mainViewModel.objectWillChange.send()
                    mainViewModel.add(player: playerName)
                    playerName = ""
                    
                    updateBarColor()
                    updateBarPercentage()
                }
                .buttonStyle(
                    CutePrimaryButton(
                        mainColor: Color("Blue"),
                        darkColor: Color("Blue-Dark"),
                        lightColor: Color("Blue-Light"),
                        font: .primary(size: 18, isBold: true),
                        disabled: playerName == "" || mainViewModel.players.count == DrinkingGame.maxPlayers
                    )
                )
                .disabled(playerName == "" || mainViewModel.players.count == DrinkingGame.maxPlayers)
                .padding(.leading)
            }
        }
        .padding(.horizontal, 20)
    }
    
//  MARK: - Body
    var body: some View {
        VStack {
            NavigationBar(
                leading: BackButton(presentationMode: presentationMode),
                center: CuteText("Jugadores", font: .primary(size: 20, isBold: true)),
                trailing: BackButton(presentationMode: presentationMode).hidden()
            )
            form
            players
            VStack(alignment: .trailing) {
                ProgressBar(
                    percentage: percentage,
                    barColor: barColor,
                    showIndicator: mainViewModel.players.count < mainViewModel.currentGame?.minPlayers ?? 0
                )
                CuteText(String(DrinkingGame.maxPlayers), color: Color("White-Dark").opacity(0.2), font: .primary(size: 12))
                    .padding(.horizontal, 20)
            }
            
            NavigationLink(destination: PlayersLocationView(mainViewModel: mainViewModel)) {
                Text("Continuar")
            }
            .isDetailLink(false)
            .buttonStyle(
                CutePrimaryButton(
                    mainColor: Color("Green"),
                    darkColor: Color("Green-Dark"),
                    lightColor: Color("Green-Light"),
                    font: .primary(size: 20, isBold: true),
                    disabled: mainViewModel.players.count < mainViewModel.currentGame?.minPlayers ?? 0
                )
            )
            .padding(.all, 20)
        }
        .background(Color("Primary"))
        .navigationBarHidden(true)
        .onAppear {
            updateBarPercentage()
            updateBarColor()
        }
    }
    
    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}
