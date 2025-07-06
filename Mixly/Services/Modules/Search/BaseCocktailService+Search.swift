//
//  BaseCocktailService+Search.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

extension BaseCocktailService {
    
    // Loading filtered by string (name) cocktails
    func loadCocktailsBy(string: String) -> [Cocktail] {
        let request: NSFetchRequest<Cocktail> = Cocktail.fetchRequest()
        
        if !string.isEmpty {
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@", string)
            request.predicate = predicate
        }
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error loading cocktails by string ")
            return []
        }
    }
    
}
