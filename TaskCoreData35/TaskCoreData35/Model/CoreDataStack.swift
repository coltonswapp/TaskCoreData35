//
//  CoreDataStack.swift
//  TaskCoreData35
//
//  Created by Colton Swapp on 7/29/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TaskCoreData35")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
