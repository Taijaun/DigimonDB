//
//  TestCoreDataStack.swift
//  DigimonDBTests
//
//  Created by Taijaun Pitt on 30/05/2023.
//

import Foundation
import CoreData

 //Create a core data stack for testing, uses in-memory store instead of SQLIte store
class TestCoreDataStack: NSObject {
    lazy var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name:"DigimonDB")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}


