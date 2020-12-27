//
//  TextField.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct CuteTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(maxWidth: .infinity, maxHeight: 51)
            .background(Color.primary.opacity(0.1))
            .font(.primary(size: 20))
            .foregroundColor(.primary)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
    }
}
