//
//  Glass.swift
//  Putis
//
//  Created by juandahurt on 24/01/21.
//

import SwiftUI

struct Glass: View {
    let maxHeight: CGFloat = Responsive.redimension(103, on: .vertical)
    
    var number: Binding<Int>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("White-Dark").opacity(0.2))
            VStack {
                Spacer(minLength: 0)
                Rectangle()
                    .fill(Color("Water"))
                    .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                    .padding(Responsive.redimension(6, on: .horizontal))
                    .frame(maxHeight: maxHeight * CGFloat(number.wrappedValue) / 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            CuteText(String(number.wrappedValue), font: .primary(size: 45, isBold: true))
        }
        .frame(width: Responsive.redimension(81, on: .horizontal), height: maxHeight)
    }
}

struct GlassPreview: PreviewProvider {
    static var previews: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Green").opacity(0.7))
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Green").opacity(0.7))
                .padding(Responsive.redimension(10, on: .horizontal))
            VStack {
                Glass(number: .constant(5))
            }
        }
    }
}
