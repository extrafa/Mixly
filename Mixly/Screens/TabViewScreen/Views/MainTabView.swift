//
//  TabView.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Первый экран")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SearchCocktailsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Третий экран")
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favourites")
                }
        }
    }
}

#Preview {
    MainTabView()
}
