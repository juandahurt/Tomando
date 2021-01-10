////
////  PlayersLocation.swift
////  Tomando
////
////  Created by juandahurt on 27/12/20.
////
//
//import SwiftUI
//
//struct PlayersLocationView: View {
//    @Environment(\.presentationMode) var presentationMode
//    
//    @ObservedObject var mainViewModel: MainViewModel
//    
//    @State var selectedPlayer: Player?
//    
//    func container(for player: Player) -> some View {
//        let playerIsDisabled = selectedPlayer?.id != player.id
//        let locationText: String = player.location == nil ? "?" : "\(player.location! + 1)"
//        let playerColor = player.location == nil ? Color.primary : Color.accept
//        
//        return HStack {
//            TouchableArea(action: {
//                selectedPlayer = player
//            }) {
//                HStack {
//                    ZStack {
//                        Rectangle().fill(Color.text)
//                        HStack {
//                            CuteText(player.name, color: playerColor, font: Font.primary(size: 18))
//                                .padding([.vertical])
//                            Spacer()
//                        }
//                    }
//                    Group {
//                        ZStack {
//                            Rectangle()
//                                .strokeBorder(
//                                    style: StrokeStyle(
//                                        lineWidth: 2,
//                                        dash: [10]
//                                    )
//                                )
//                                .foregroundColor(playerColor.opacity(0.6))
//                                .frame(maxWidth: UIScreen.main.bounds.width / 7.5)
//                            CuteText(locationText, color: playerColor, font: Font.primary(size: 18))
//                        }
//                    }
//                }
//                .opacity(playerIsDisabled ? 0.5 : 1)
//            }
//        }
//        .padding([.horizontal, .bottom])
//    }
//    
//    var playersContainer: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color.text)
//                .cornerRadius(10, corners: .topLeft)
//                .cornerRadius(10, corners: .topRight)
//            VStack(alignment: .leading) {
//                Group {
//                    if selectedPlayer == nil {
//                        CuteText("Selecciona un jugador", color: .primary, font: Font.primary(size: 20, isBold: true))
//                    } else {
//                        CuteText("Selecciona una ubicación", color: .primary, font: Font.primary(size: 20, isBold: true))
//                    }
//                }
//                .padding([.horizontal, .top])
//                ScrollView {
//                    ForEach(mainViewModel.players) { player in
//                        container(for: player)
//                    }
//                }
//            }
//        }
//        .frame(maxHeight: UIScreen.main.bounds.height / 3)
//    }
//    
//    var body: some View {
//        VStack {
//            NavigationBar(
//                leading: BackButton(presentationMode: presentationMode),
//                center: CuteText("Ubicación", font: Font.primary(size: 22, isBold: true)),
//                trailing: TouchableArea(action: {
//                    print("Shuffle!")
//                }) {
//                    ZStack {
//                        Circle()
//                            .fill(Color.primary)
//                            .frame(width: 40, height: 40)
//                        Image("Shuffle")
//                    }
//                }
//            )
//            Spacer()
//            GeometryReader { geometry in
//                PlayersLocation(
//                    in: geometry.size,
//                    mainViewModel: mainViewModel,
//                    selectedPlayer: selectedPlayer,
//                    onSelectLocation: { location in
//                        mainViewModel.objectWillChange.send()
//                        mainViewModel.setLocation(for: selectedPlayer!, at: location)
//                        selectedPlayer = nil
//                    }
//                )
//            }
//            Spacer()
//            playersContainer
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.primary)
//        .navigationBarHidden(true)
//    }
//}
//
//struct PlayersLocation: View {
//    var size: CGSize
//    @ObservedObject var mainViewModel: MainViewModel
//    var selectedPlayer: Player?
//    
//    var onSelectLocation: (Int) -> Void
//    
//    private var mainCircleWidth: CGFloat
//    private var mainCircleHeight: CGFloat
//    private var center: CGPoint
//    
//    private let playersCircleRadius: Double
//    private let angleBeetwenEachPlayer: Double
//    
//    init(in size: CGSize, mainViewModel: MainViewModel, selectedPlayer: Player?, onSelectLocation: @escaping (Int) -> Void) {
//        self.size = size
//        self.mainViewModel = mainViewModel
//        self.mainCircleWidth = size.width * 0.3
//        self.mainCircleHeight = mainCircleWidth
//        
//        // El circulo de los jugadores es más grande que el circulo principal
//        self.playersCircleRadius = Double(mainCircleWidth / 2) * 1.9
//        
//        // Angulo que separa cada posición de cada jugador
//        self.angleBeetwenEachPlayer = .deg2rad(360.0 / Double(mainViewModel.players.count))
//        
//        // Obtener el centro de la circunferencia
//        self.center = .zero
//        center.x = size.width / 2
//        center.y = size.height / 2
//        
//        self.selectedPlayer = selectedPlayer
//        self.onSelectLocation = onSelectLocation
//    }
//    
//    func place(for player: Player, index: Int) -> some View {
//        var newPosition: CGPoint = .zero
//        newPosition.x = CGFloat(playersCircleRadius * cos(2.0 * .pi - angleBeetwenEachPlayer * Double(index))) + center.x
//        newPosition.y = CGFloat(playersCircleRadius * sin(2.0 * .pi - angleBeetwenEachPlayer * Double(index))) + center.y
//        let placeIsTaken = mainViewModel.players.first { $0.location == index } != nil
//        
//        return Group {
//            ZStack {
//                Group {
//                    if placeIsTaken {
//                        Rectangle()
//                            .strokeBorder(
//                                style: StrokeStyle(
//                                    lineWidth: 2,
//                                    dash: [10]
//                                )
//                            )
//                            .foregroundColor(Color.accept.opacity(0.6))
//                    } else {
//                        Rectangle()
//                            .strokeBorder(
//                                style: StrokeStyle(
//                                    lineWidth: 2,
//                                    dash: [10]
//                                )
//                            )
//                            .foregroundColor(Color.secondary)
//                    }
//                }
//                
//                CuteText(String(index + 1))
//            }
//            .frame(width: size.width / 7.5, height: size.width / 7.5)
//            .position(newPosition)
//            .onTapGesture {
//                if !placeIsTaken && selectedPlayer != nil  {
//                    onSelectLocation(index)
//                }
//            }
//        }
//    }
//    
//    var body: some View {
//        ZStack {
//            Image("Players Table")
//                .resizable()
//                .frame(maxWidth: mainCircleWidth, maxHeight: mainCircleHeight)
//            ForEach(mainViewModel.players.indices) { playerIndex in
//                place(for: mainViewModel.players[playerIndex], index: playerIndex)
//            }
//        }
//        .frame(width: size.width, height: size.height)
//    }
//}
