//
//  NetworkerProtocol.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

protocol Networker {
    func callDigimonApi(url: URL) async throws -> Data
}
