//
//  NetworkManager.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

class NetworkManager: Networker {
    func callDigimonApi(url: URL) async throws -> Data {
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch let error{
            throw error
        }
        
    }
    
    
}
