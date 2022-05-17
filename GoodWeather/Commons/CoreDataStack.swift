//
//  CoreDataStack.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 17/05/2022.
//

/*
 The managed object model represents each object type in your app’s data model, the properties they can have, and the relationship between them.
 
 A persistent store can be backed by a SQLite database (the default), XML, a binary file or in-memory store. You can also provide your own backing store with the incremental store API.
 
 The persistent store coordinator hides the implementation details of how your persistent stores are configured and presents a simple interface for your managed object context.
 
 The managed object context manages the lifecycles of the managed objects it creates or fetches. They are responsible for fetching, editing and deleting managed objects, as well as more powerful features such as validation, faulting and inverse relationship handling.
 */

import Foundation
import CoreData

final class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var pesistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Storage error \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        pesistentContainer.viewContext
    }
    
}
