//
//  TomandoApp.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

@main
struct TomandoApp: App {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(.primary)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
