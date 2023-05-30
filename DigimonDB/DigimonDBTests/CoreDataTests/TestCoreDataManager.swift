//
//  TestCoreDataManager.swift
//  DigimonDBTests
//
//  Created by Taijaun Pitt on 30/05/2023.
//

import Foundation
import CoreData
@testable import DigimonDB

class TestCoreDataManager: CoreDataOperationalProtocol{
    func saveDataToDatabase(list: [DigimonDB.Digimon]) async throws {
        
    }
    
    func getDigimonDataFromDatabase() async -> [DigimonDB.DigimonEntity] {
        return [DigimonEntity(context: TestCoreDataStack().persistentContainer.viewContext)]
    }
    
    func toggleFavourite(digimon: DigimonDB.DigimonEntity) {
        
    }
    
    func fetchFavourites() async -> [DigimonDB.DigimonEntity] {
        return [DigimonEntity(context: TestCoreDataStack().persistentContainer.viewContext)]
    }
    
    var mainContext: NSManagedObjectContext
    var coreDataStack: TestCoreDataStack
    
    init(mainContext: NSManagedObjectContext, coreDataStack: TestCoreDataStack) {
        self.mainContext = mainContext
        self.coreDataStack = coreDataStack
    }
}
