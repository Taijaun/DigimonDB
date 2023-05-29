//
//  DigimonCardViewModel.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

@MainActor
class DigimonCardViewModel: ObservableObject {
    @Published var digimonList = [Digimon]()
    @Published var customisedError : NetworkingError?
    
    var manager: Networker
    
    init(manager: Networker){
        self.manager = manager
    }
    
    func getDigimonList(urlString: String, coreDataManager: CoreDataOperationalProtocol) async {
        guard let url = URL(string: urlString) else {
            customisedError = NetworkingError.invalidURL
            return
        }
        do {
            let data = try await self.manager.callDigimonApi(url: url)
            
            let digimonData = try JSONDecoder().decode([Digimon].self, from: data)
            self.digimonList = digimonData
            
            try await coreDataManager.saveDataToDatabase(list: self.digimonList)
        } catch let error {
            if error as? NetworkingError == .parsingError{
                customisedError = .parsingError
            } else {
                customisedError = .dataNotFound
            }
        }
    }
}
