//
//  NavigationBar.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct NavigationBar: View {
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            BackButton(presentationMode: presentationMode)
            Spacer()
        }
        .padding([.horizontal, .vertical], 20)
    }
}
