//
//  PersistenceController.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

final class PersistenceController {
    
    static let shared = PersistenceController()
    
    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MixlyModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Error initializing MixlyModel: \(error)")
            }
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }
}
