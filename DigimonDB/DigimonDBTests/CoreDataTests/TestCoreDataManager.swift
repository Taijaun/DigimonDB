//
//  TestCoreDataManager.swift
//  DigimonDBTests
//
//  Created by Taijaun Pitt on 30/05/2023.
//

import Foundation
import CoreData

class TestCoreDataManager{
    var mainContext: NSManagedObjectContext
    var coreDataStack: TestCoreDataStack
    
    init(mainContext: NSManagedObjectContext, coreDataStack: TestCoreDataStack) {
        self.mainContext = mainContext
        self.coreDataStack = coreDataStack
    }
}
