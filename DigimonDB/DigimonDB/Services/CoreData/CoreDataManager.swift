//
//  CoreDataManager.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation
import CoreData

class CoreDataManager: CoreDataOperationalProtocol {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func saveDataToDatabase(list: [Digimon]) async throws {
        await deleteTable()
        
        try await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
            
            list.forEach { digimon in
                
                let entity = DigimonEntity(context: privateContext)
                entity.id = digimon.id
                entity.artist = digimon.artist
                entity.attribute = digimon.attribute
                entity.cardnumber = digimon.cardnumber
                entity.cardrarity = digimon.cardrarity
                entity.color = digimon.color
                entity.digi_type = digimon.digiType
                entity.dp = Int64(digimon.dp ?? 0)
                entity.evolution_cost = Int64(digimon.evolutionCost ?? 0)
                entity.image_url = digimon.imageURL
                entity.isfavourited = false
                entity.level = Int64(digimon.level ?? 0)
                entity.maineffect = digimon.maineffect
                entity.name = digimon.name
                entity.play_cost = Int64(digimon.playCost ?? 0)
                entity.stage = digimon.stage
                entity.type = digimon.type
            }
            do {
                try privateContext.save()
                print("Data saved")
            } catch let error {
                print(error.localizedDescription)
                throw error
            }
        }
        
    }
    
    func getDigimonDataFromDatabase() async -> [DigimonEntity] {
        await PersistenceController.shared.container.performBackgroundTask{ (privateContext) in
            
            let digimonListFetchRequest = DigimonEntity.fetchRequest()
            let result = (try? privateContext.fetch(digimonListFetchRequest)) ?? []
            return result
        }
    }
    
    private func deleteAll() async {
        
        let digimonList = await self.getDigimonDataFromDatabase()
        
        await PersistenceController.shared.container.performBackgroundTask { (privateContext) in
            digimonList.forEach { digimon in
                privateContext.delete(digimon)
            }
            
            do {
                try privateContext.save()
                print("DB Cleared")
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func deleteTable() async {
        let digimonFetch: NSFetchRequest<NSFetchRequestResult> = DigimonEntity.fetchRequest()
        let deleteTable1 = NSBatchDeleteRequest(fetchRequest: digimonFetch)
        _ = try? context.execute(deleteTable1)
    }
    
    func loadRandomCard()-> DigimonEntity{
        //await PersistenceController.shared.container.performBackgroundTask{ (privateContext) in
            let digimonFetchRequest = DigimonEntity.fetchRequest()
            let result = (try? context.fetch(digimonFetchRequest)) ?? []
            
            let randomIndex = Int(arc4random_uniform(UInt32(result.count)))
            let randomDigimon = result[randomIndex]
            return randomDigimon
        }
        
    }
    
    
