//
//  BaseCocktailService+Categories.swift
//  Mixly
//
//  Created by Ross on 22.06.2025.
//

import Foundation
import CoreData

extension BaseCocktailService {
    
    func loadCategories() -> [Category] {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error loading all categories")
            return []
        }
    }
    
    func loadCocktailsBy(category: String) -> [Cocktail] {
        let request: NSFetchRequest<Cocktail> = Cocktail.fetchRequest()
        
        if !category.isEmpty {
            let predicate = NSPredicate(format: "category.label ==[c] %@", category)
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
