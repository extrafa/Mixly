//
//  MixlyApp.swift
//  Mixly
//
//  Created by Ross on 19.06.2025.
//

import SwiftUI

@main
struct MixlyApp: App {
    
    init() {
        CocktailProvider.importCocktailsToCoreData()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
