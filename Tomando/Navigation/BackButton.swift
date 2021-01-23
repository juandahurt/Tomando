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
                    .frame(width: Responsive.redimension(50, on: .horizontal), height: Responsive.redimension(50, on: .horizontal))
                Image("Back")
                    .resizable()
                    .frame(width: Responsive.redimension(18, on: .horizontal), height: Responsive.redimension(18, on: .horizontal))
            }
            .padding(.vertical)
        }
    }
}
