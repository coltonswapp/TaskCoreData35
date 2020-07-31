//
//  TaskController.swift
//  TaskCoreData35
//
//  Created by Colton Swapp on 7/29/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    // MARK: - Shared Instance
    static let sharedInstance = TaskController()
    
    // MARK: - Source of truth / FRC
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "taskName", ascending: true)]
        
        let resultsController: NSFetchedResultsController<Task> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
   
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error fetching data")
        }
    }
    
//    // MARK: - Source of Truth
//    var tasks : [Task] = []
//
//
//
    // MARK: - CRUD FUNCS
    
    func add(taskWithName name: String, notes: String, due: Date?) {
        _ = Task(taskName: name, notes: notes, due: Date())
        saveToPersistentStore()
    }
    
    func toggleIsComplete(with task: Task) {
        task.isComplete.toggle()
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.taskName = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        let moc = CoreDataStack.context
        moc.delete(task)
        saveToPersistentStore()
        
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
          try moc.save()
        } catch let saveError {
          print("There was a problem saving to CoreData: \(saveError)")
        }
    }
    
//    func fetchTasks() -> [Task] {
//        let request: NSFetchRequest<Task> = Task.fetchRequest()
//        CoreDataStack.context.performf
//        return
//    }
}
