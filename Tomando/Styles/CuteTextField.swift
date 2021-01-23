//
//  TextField.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

struct CuteTextField: TextFieldStyle {
    var width: CGFloat = .infinity
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.center)
            .frame(width: width, height: Responsive.redimension(43, on: .vertical))
            .background(color)
            .cornerRadius(10)
            .font(.primary(size: Responsive.redimension(20, on: .vertical)))
            .foregroundColor(foregroundColor)
    }
    
    let color = Color("White-Dark").opacity(0.2)
    let foregroundColor = Color("White-Dark")
}
