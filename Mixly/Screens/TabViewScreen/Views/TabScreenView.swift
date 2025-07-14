//
//  TabView.swift
//  Mixly
//
//  Created by Ross on 14.07.2025.
//

import SwiftUI

struct TabScreenView: View {
    var body: some View {
        TabView {
            SearchCocktailsView()
                .tabItem { Image(systemName: "house.fill" )}
            
            // Recently searched (future logic)
            Text("Recent")
                .tabItem { Image(systemName: "clock.arrow.circlepath" )}
            
            // Favourites Screen (future logic)
            Text("Favourites")
                .tabItem { Image(systemName: "bookmark" )}
        }
        .tint(.cyan)
    }
}

#Preview {
    TabScreenView()
}
