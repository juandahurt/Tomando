//
//  TomandoApp.swift
//  Tomando
//
//  Created by juandahurt on 24/12/20.
//

import SwiftUI

@main
struct TomandoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(AppState())
        }
    }
}


class AppState: ObservableObject {
    @Published var moveToMainMenu: Bool = false
}
