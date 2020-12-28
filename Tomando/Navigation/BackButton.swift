//
//  BackButton.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct BackButton: View {
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        TouchableArea(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            ZStack {
                Circle()
                    .fill(Color.primary)
                    .frame(width: 50, height: 50)
                Image("Back")
            }
            .padding(.vertical)
        }
    }
}
