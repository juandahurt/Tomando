//
//  Modal.swift
//  Tomando
//
//  Created by juandahurt on 26/12/20.
//

import SwiftUI

struct Modal<Content: View>: View {
    var isPresented: Binding<Bool>
    var content: Content
    var size: CGSize
    var title: String
    
    init(isPresented: Binding<Bool>, size: CGSize = CGSize(width: 200, height: 200), title: String = "", content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.size = size
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        Group {
            if isPresented.wrappedValue {
                ZStack {
                    Rectangle()
                        .fill(Color.black.opacity(0.3))
                        .onTapGesture {
                            isPresented.wrappedValue = false
                        }
                    ZStack {
                        Rectangle()
                            .fill(Color("White-Dark"))
                            .cornerRadius(10)
                        VStack {
                            content
                            Spacer()
                        }
                    }
                    .frame(maxWidth: size.width, maxHeight: size.height)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 90)
                }
            } else {
                EmptyView()
                    .hidden()
            }
        }
        
    }
}
