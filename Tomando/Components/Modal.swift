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
                            .fill(Color.text)
                            .cornerRadius(10)
                        VStack {
                            HStack {
                                RegularText(title, color: .primary, font: .primary(size: 18))
                                Spacer()
                                TouchableArea(action: { isPresented.wrappedValue = false }) {
                                    Image("Close")
                                }
                            }
                                .padding()
                            content
                            Spacer()
                        }
                        
                    }
                    .frame(width: size.width, height: size.height)
                }
            } else {
                EmptyView()
                    .hidden()
            }
        }
        
    }
}
