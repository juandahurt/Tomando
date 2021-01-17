//
//  DraggableContainer.swift
//  Tomando
//
//  Created by juandahurt on 17/01/21.
//

import SwiftUI

struct DraggableContainer<Content: View>: View {
    var content: Content
    var onDrop: (DragGesture.Value) -> Void
    @State private var dragAmount: CGSize = .zero
    
    init(onDrop: @escaping (DragGesture.Value) -> Void, content: () -> Content) {
        self.content = content()
        self.onDrop = onDrop
    }
    
    var body: some View {
        content
            .offset(x: dragAmount.width, y: dragAmount.height)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged { value in
                        dragAmount.width = value.translation.width
                        dragAmount.height = value.translation.height
                    }
                    .onEnded { value in
                        dragAmount = .zero
                        onDrop(value)
                    }
            )
    }
}
