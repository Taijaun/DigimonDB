//
//  FakeNetworkManager.swift
//  DigimonDBTests
//
//  Created by Taijaun Pitt on 30/05/2023.
//

import Foundation
@testable import DigimonDB

class FakeNetworkManager: Networker{
    
    func callDigimonApi(url: URL) async throws -> Data {
        let bundle = Bundle(for: FakeNetworkManager.self)
        
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {throw NetworkingError.invalidURL}
        
        do {
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkingError.dataNotFound
        }
    }
    
    
}
