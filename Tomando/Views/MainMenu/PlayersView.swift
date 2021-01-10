////
////  ParticipantsView.swift
////  Tomando
////
////  Created by juandahurt on 25/12/20.
////
//
//import SwiftUI
//
//// TODO: Al volver a la pantalla anterior y regresar, la comparacion para saber si
////       el usuario puede continuar no funciona!
//
//struct PlayersView: View {
//    @Environment(\.presentationMode) var presentationMode
//    
//    @ObservedObject var mainViewModel: MainViewModel
//    @State private var addAttendantIsPresented = false
//    @State private var userCanContinue = false
//    
//    init(mainViewModel: MainViewModel) {
//        self.mainViewModel = mainViewModel
//    }
//    
//    var playersList: some View {
//        Group {
//            if mainViewModel.players.isEmpty {
//                CuteText("Agrega a los jugadores...", color: Color.text.opacity(0.7))
//            } else {
//                ScrollView {
//                    ForEach(mainViewModel.players) {attendant in
//                        row(for: attendant)
//                    }
//                }
//            }
//        }
//    }
//    
//    func row(for player: Player) -> some View {
//        let padding = EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
//        
//        return ZStack {
//            Rectangle()
//                .fill(Color.text)
//                .frame(maxWidth: .infinity, maxHeight: 50)
//                .cornerRadius(10)
//            HStack {
//                CuteText(player.name, color: .primary)
//                Spacer()
//                Image("Close")
//            }
//            .padding()
//        }
//        .padding(padding)
//    }
//    
//    func checkIfUserCanContinue() {
//        if let currentGame = mainViewModel.currentGame {
//            userCanContinue = mainViewModel.players.count >= currentGame.minPlayers
//        }
//    }
//    
//    var body: some View {
//        ZStack {
//            NavigationView {
//                VStack {
//                    NavigationBar(
//                        leading: BackButton(presentationMode: presentationMode),
//                        center: CuteText("Jugadores", font: Font.primary(size: 22, isBold: true)),
//                        trailing: AddButton().onTapGesture {
//                            addAttendantIsPresented = true
//                        }
//                    )
//                    Spacer()
//                    
//                    playersList
//                    
//                    Spacer()
//                    NavigationLink(destination: PlayersLocationView(mainViewModel: mainViewModel)) {
//                        DisabableArea(isDisabled: !userCanContinue) {
//                            ZStack {
//                                Rectangle()
//                                    .fill(Color.secondary)
//                                CuteText("Continuar", font: Font.primary(size: 20, isBold: true))
//                            }
//                            .cornerRadius(10)
//                            .frame(maxWidth: .infinity, maxHeight: 51)
//                            .padding(continueButtonPadding)
//                        }
//                    }
//                    .disabled(!userCanContinue)
//                }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.primary)
//                    .navigationBarHidden(true)
//            }
//                .navigationBarHidden(true)
//            Modal(isPresented: $addAttendantIsPresented, size: CGSize(width: 300, height: 180), title: "Nuevo jugador") {
//                AddPlayerForm(
//                    mainViewModel: mainViewModel,
//                    onSuccess: {
//                        addAttendantIsPresented = false
//                        checkIfUserCanContinue()
//                    }
//                )
//            }
//        }
//        .onAppear(perform: {
//            checkIfUserCanContinue()
//        })
//    }
//    
//    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
//}
//
//struct AddButton: View {
//    
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(Color.accept)
//                .frame(width: 50, height: 50)
//            Image("Plus")
//        }
//    }
//}
//
//struct AddPlayerForm: View {
//    @ObservedObject var mainViewModel: MainViewModel
//    
//    @State private var isDisabled = true
//    @State private var newPlayerName: String = ""
//    
//    var onSuccess: () -> Void
//    
//    var body: some View {
//        VStack {
//            TextField("Nombre", text: $newPlayerName)
//                .textFieldStyle(CuteTextField())
//                .onChange(of: newPlayerName, perform: { _ in
//                    isDisabled = newPlayerName.isEmpty
//                })
//            Button("Agregar") {
//                mainViewModel.objectWillChange.send()
//                mainViewModel.add(player: newPlayerName)
//                // TODO: Agregar funcionalidad cuando hay error
//                onSuccess()
//            }
//            .disabled(isDisabled)
//            .buttonStyle(
//                CuteButton(backgroundColor: .accept, foregroundColor: .text, font: Font.primary(size: 20, isBold: true), isDisabled: isDisabled)
//            )
//        }
//        .padding([.horizontal, .bottom])
//    }
//}
