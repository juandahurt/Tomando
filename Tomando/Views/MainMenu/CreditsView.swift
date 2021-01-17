//
//  CreditsView.swift
//  Tomando
//
//  Created by juandahurt on 17/01/21.
//

import SwiftUI

struct CreditsView: View {
    @State var yOffset: CGFloat = UIScreen.main.bounds.size.height
    var messages: [String] = [
        "¡Hola!",
        "Esta app fue diseñada y desarrollada por un don nadie que vive en el medio de una pequeña ciudad al suroccidente colombiano.",
        "Si la deseas calificar en la AppStore, siéntete libre de hacerlo.",
        "Ojalá sientas la misma satisfacción al usarla que yo al hacerla.",
        "Un abrazo y gracias.",
        "",
        "Popayán, Colombia",
        "2021",
        "",
        "",
        "",
        "PD: Por tu salud, y anque parezca contradictorio, procura no tomar en exceso."
    ]
    let timer = Timer.publish(every: 13, on: .main, in: .common).autoconnect()
    @State var showDismmiss = false
    @Environment(\.presentationMode) var presentationMode
    
    func dismissalText() -> some View {
        let text = showDismmiss ? "Toca en cualquier parte de la pantalla para regresar..." : ""
        
        return CuteText(text, color: Color("White-Dark").opacity(0.4), font: .secondary(size: 12))
    }
    
    var body: some View {
        VStack {
            dismissalText()
                .padding(.top)
            Spacer()
            VStack(spacing: 20) {
                ForEach(messages, id: \.self) { message in
                    CuteText(message, color: Color("White-Dark"), font: .secondary(size: 20))
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .offset(x: 0, y: yOffset)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .navigationBarHidden(true)
        .onAppear {
            withAnimation(Animation.linear(duration: 13)) {
                yOffset = 0
            }
        }
        .onReceive(timer) { _ in
            timer.upstream.connect().cancel()
            withAnimation(.easeOut) {
                showDismmiss = true
            }
        }
        .onTapGesture {
            if showDismmiss {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
