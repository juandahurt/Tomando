//
//  NavigationBar.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct NavigationBar<L, T>: View where L: View, T: View {
    var leadingView: L
    var title: String
    var trailingView: T
    
    init(leading: L, title: String = "", trailing: T) {
        self.leadingView = leading
        self.title = title
        self.trailingView = trailing
    }
    
    var body: some View {
        HStack {
            leadingView
            Spacer()
            RegularText(title)
            Spacer()
            trailingView
        }
        .padding([.horizontal, .vertical], 15)
    }
}
