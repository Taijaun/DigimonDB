//
//  NetworkingError.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

enum NetworkingError {
    
    case dataNotFound
    case invalidURL
    case parsingError
    
}

extension NetworkingError: LocalizedError{
    
    var errorDesc : String? {
        
        switch self{
            
        case .dataNotFound:
            return NSLocalizedString("There was an error retrieving data from the API", comment: "Data not Found")
        case .invalidURL:
            return NSLocalizedString("The URL is invalid", comment: "Invalid URL")
        case .parsingError:
            return NSLocalizedString("There was an error while attempting to parse the data", comment: "Parsing error")
        }
        
    }
    
}
