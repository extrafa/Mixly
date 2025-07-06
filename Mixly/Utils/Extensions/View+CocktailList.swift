//
//  View+CocktailList.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import SwiftUI

struct CocktailListView: View {
    let cocktails: [Cocktail]
    @Binding var searchString: String
    let onSearch: (String) -> Void
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(cocktails) { cocktail in
                    CocktailCardView(
                        imageURL: cocktail.image ?? "notFound",
                        name: cocktail.name ?? "Not found",
                        alcoholic: cocktail.alcoholic)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .searchable(text: $searchString, prompt: "Search Cocktails")
        .onSubmit(of: .search) { onSearch(searchString) }
    }
}
