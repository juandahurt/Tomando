//
//  DisabableArea.swift
//  Tomando
//
//  Created by juandahurt on 26/12/20.
//

import SwiftUI

struct DisabableArea<Content: View>: View {
    var isDisabled: Bool
    var content: Content
    
    init(isDisabled: Bool, content: () -> Content) {
        self.isDisabled = isDisabled
        self.content = content()
    }
    
    var body: some View {
        content
            .opacity(isDisabled ? opacityWhenDisabled : 1)
    }
    
    let opacityWhenDisabled: Double = 0.6
}

