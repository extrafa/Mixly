//
//  BaseCocktailService.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

final class BaseCocktailService: CocktailService {
    let context = PersistenceController.shared.context
}
