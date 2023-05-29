//
//  CoreDataOperationsProtocol.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

protocol CoreDataOperationalProtocol {
    
    func saveDataToDatabase(list: [Digimon]) async throws
    func getDigimonDataFromDatabase() async -> [DigimonEntity]
    
}
