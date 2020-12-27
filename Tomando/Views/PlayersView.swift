//
//  ParticipantsView.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

// TODO: Al volver a la pantalla anterior y regresar, la comparacion para saber si
//       el usuario puede continuar no funciona!

struct AttendantsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var mainViewModel: MainViewModel
    @State private var addAttendantIsPresented = false
    @State private var userCanContinue = false
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        checkIfUserCanContinue()
    }
    
    var playersList: some View {
        Group {
            if mainViewModel.players.isEmpty {
                RegularText("Agrega a los jugadores...", color: Color.text.opacity(0.7))
            } else {
                ScrollView {
                    ForEach(mainViewModel.players) {attendant in
                        row(for: attendant)
                    }
                }
            }
        }
    }
    
    func row(for attendant: Player) -> some View {
        let padding = EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return ZStack {
            Rectangle()
                .fill(Color.text)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .cornerRadius(10)
            HStack {
                RegularText(attendant.name, color: .primary)
                Spacer()
                Image("Close")
                    .renderingMode(.template)
                    .listItemTint(.error)
            }
            .padding()
        }
        .padding(padding)
    }
    
    func checkIfUserCanContinue() {
        if let currentGame = mainViewModel.currentGame {
            userCanContinue = mainViewModel.players.count >= currentGame.minPlayers
        }
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    NavigationBar(
                        leading: BackButton(presentationMode: presentationMode),
                        trailing: AddButton().onTapGesture {
                            addAttendantIsPresented = true
                        }
                    )
                    Spacer()
                    
                    playersList
                    
                    Spacer()
                    DisabableArea(isDisabled: !userCanContinue) {
                        ZStack {
                            Rectangle()
                                .fill(Color.accept)
                            RegularText("Continuar")
                        }
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .padding(continueButtonPadding)
                    }
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.primary)
                    .navigationBarHidden(true)
            }
                .navigationBarHidden(true)
            Modal(isPresented: $addAttendantIsPresented, size: CGSize(width: 300, height: 180), title: "Nuevo participante") {
                AddAttendantForm(
                    mainViewModel: mainViewModel,
                    onSuccess: {
                        addAttendantIsPresented = false
                        checkIfUserCanContinue()
                    }
                )
            }
        }
    }
    
    let continueButtonPadding = EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
}

struct AddButton: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accept)
                .frame(width: 50, height: 50)
            Image("Plus")
        }
    }
}

struct AddAttendantForm: View {
    @ObservedObject var mainViewModel: MainViewModel
    
    @State private var isDisabled = true
    @State private var newAttendantName: String = ""
    
    var onSuccess: () -> Void
    
    var body: some View {
        VStack {
            TextField("Nombre", text: $newAttendantName)
                .textFieldStyle(CuteTextField())
                .onChange(of: newAttendantName, perform: { _ in
                    isDisabled = newAttendantName.isEmpty
                })
            Button("Agregar") {
                mainViewModel.objectWillChange.send()
                mainViewModel.add(attendant: newAttendantName)
                // TODO: Agregar funcionalidad cuando hay error
                onSuccess()
            }
            .disabled(isDisabled)
            .buttonStyle(
                CuteButton(backgroundColor: .accept, foregroundColor: .text, isDisabled: isDisabled)
            )
        }
        .padding([.horizontal, .bottom])
    }
}
