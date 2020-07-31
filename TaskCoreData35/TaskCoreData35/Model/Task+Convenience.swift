//
//  Task+Convenience.swift
//  TaskCoreData35
//
//  Created by Colton Swapp on 7/29/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(taskName: String, notes: String = "", due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.taskName = taskName
        self.notes = notes
        self.due = due
    }
}
