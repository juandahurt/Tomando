//
//  TouchableArea.swift
//  Tomando
//
//  Created by juandahurt on 25/12/20.
//

import SwiftUI

struct TouchableArea<Content: View>: View {
    var action: () -> Void
    var content: Content
    
    init(action: @escaping () -> Void, content: @escaping () -> Content) {
        self.content = content()
        self.action = action
    }
    
    var body: some View {
        self.content.onTapGesture {
            action()
        }
    }
}
