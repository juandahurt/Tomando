//
//  TextField.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct FunnyTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(maxWidth: .infinity, maxHeight: 43)
            .background(Color.text)
            .font(.custom("Lato-Regular", size: 20))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)    }
}
