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
    
    @Published private(set) var loadingState: ViewStates = .loading
    
    var manager: Networker
    var coreDataManager: CoreDataOperationalProtocol
    
    init(manager: Networker, coreDataManager: CoreDataOperationalProtocol){
        self.manager = manager
        self.coreDataManager = coreDataManager
    }
    
    func getDigimonList(urlString: String, coreDataManager: CoreDataOperationalProtocol) async {
        guard let url = URL(string: urlString) else {
            customisedError = NetworkingError.invalidURL
            loadingState = .error
            return
        }
        do {
            let data = try await self.manager.callDigimonApi(url: url)
            
            let digimonData = try JSONDecoder().decode([Digimon].self, from: data)
            self.digimonList = digimonData
            
            
            try await coreDataManager.saveDataToDatabase(list: self.digimonList)
            loadingState = .loaded
        } catch let error {
            switch error{
            case is DecodingError:
                customisedError = .parsingError
            case is URLError:
                customisedError = .invalidURL
            case let .dataNotFound as NetworkingError:
                customisedError = .dataNotFound
            case let .invalidURL as NetworkingError:
                customisedError = .invalidURL
            default:
                customisedError = .dataNotFound
            }
            
            loadingState = .error
//            if error as? NetworkingError == .parsingError{
//                customisedError = .parsingError
//            } else {
//                customisedError = .dataNotFound
//            }
        }
    }
}
