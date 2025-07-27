//
//  BaseCocktailService+Favourites.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

extension BaseCocktailService {
    
    // Loading filtered by isFavourite cocktails
    func loadFavouritesCocktails() -> [Cocktail] {
        let request: NSFetchRequest<Cocktail> = Cocktail.fetchRequest()
        request.predicate = NSPredicate(format: "isFavourite == True")
        
        let sortDescriptor = NSSortDescriptor(key: "favouriteAddedDate", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error loading favourites cocktails")
            return []
        }
    }
    
    // Adding and removing favourites cocktails
    func toggleCocktailFavourite(cocktail: Cocktail) {
        cocktail.isFavourite.toggle()
        if cocktail.isFavourite {
            cocktail.favouriteAddedDate = Date()
        } else {
            cocktail.favouriteAddedDate = nil
        }
        
        do {
            try context.save()
        } catch {
            print("Error saving context")
        }
    }
    
}
