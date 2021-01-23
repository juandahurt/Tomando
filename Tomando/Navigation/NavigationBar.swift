//
//  NavigationBar.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct NavigationBar<L, C, T>: View where L: View, C: View, T: View {
    var leadingView: L
    var center: C
    var trailingView: T
    
    init(leading: L, center: C, trailing: T) {
        self.leadingView = leading
        self.center = center
        self.trailingView = trailing
    }
    
    var body: some View {
        HStack {
            leadingView
            Spacer()
            center
            Spacer()
            trailingView
        }
        .padding(.horizontal, Responsive.redimension(15, on: .horizontal))
    }
}
