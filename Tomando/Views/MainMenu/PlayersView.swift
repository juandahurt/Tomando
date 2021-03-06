//
//  ParticipantsView.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

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
                CuteText(player.name, color: Color("White-Dark").opacity(0.4), font: .primary(size: Responsive.redimension(16, on: .vertical)))
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
            .padding(.top, Responsive.redimension(5, on: .vertical))
        }
        .padding(.all, Responsive.redimension(20, on: .horizontal))
    }
    
//  MARK: - Form
    var form: some View {
        VStack(alignment: .leading, spacing: 2) {
            CuteText("Nombre", color: Color("White-Dark").opacity(0.2), font: Font.primary(size: Responsive.redimension(16, on: .vertical), isBold: true))
            HStack {
                TextField("", text: $playerName)
                    .textFieldStyle(CuteTextField(width: Responsive.redimension(212, on: .horizontal)))
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
                        font: .primary(size: Responsive.redimension(18, on: .vertical), isBold: true),
                        disabled: playerName == "" || mainViewModel.players.count == DrinkingGame.maxPlayers
                    )
                )
                .disabled(playerName == "" || mainViewModel.players.count == DrinkingGame.maxPlayers)
                .padding(.leading)
            }
        }
        .padding(.horizontal, Responsive.redimension(20, on: .horizontal))
    }
    
//  MARK: - Body
    var body: some View {
        VStack {
            NavigationBar(
                leading: BackButton(presentationMode: presentationMode),
                center: CuteText("Jugadores", font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true)),
                trailing: BackButton(presentationMode: presentationMode).hidden()
            )
            form
            players
            VStack(alignment: .trailing) {
                ProgressBar(
                    height: Responsive.redimension(12, on: .vertical),
                    xPadding: Responsive.redimension(20, on: .horizontal),
                    percentage: percentage,
                    barColor: barColor,
                    showIndicator: mainViewModel.players.count < mainViewModel.currentGame?.minPlayers ?? 0,
                    indicatorPercentage: CGFloat(Double(mainViewModel.currentGame?.minPlayers ?? 0) / Double(DrinkingGame.maxPlayers))
                )
                CuteText(String(DrinkingGame.maxPlayers), color: Color("White-Dark").opacity(0.2), font: .primary(size: Responsive.redimension(12, on: .vertical)))
                    .padding(.trailing, Responsive.redimension(20, on: .horizontal))
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
                    font: .primary(size: Responsive.redimension(20, on: .vertical), isBold: true),
                    disabled: mainViewModel.players.count < mainViewModel.currentGame?.minPlayers ?? 0
                )
            )
            .padding(.all, Responsive.redimension(20, on: .horizontal))
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
