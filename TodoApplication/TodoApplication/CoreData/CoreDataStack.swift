//
//  CoreDataStack.swift
//  TodoApplication
//
//  Created by Akash Vemulapalli on 2/13/19.
//  Copyright © 2019 Vemulapalli. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var container: NSPersistentContainer {
    let container = NSPersistentContainer(name: "Todos")
    container.loadPersistentStores { (description, error) in
        guard error == nil else
        {
            print("Error: \(error!)")
            return
        }
    }
        
        return container
    }

    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
}
