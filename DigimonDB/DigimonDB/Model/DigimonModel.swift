//
//  DigimonModel.swift
//  DigimonDB
//
//  Created by Taijaun Pitt on 29/05/2023.
//

import Foundation

struct Digimon: Codable, Identifiable, Hashable {
    var name, type, color, stage: String?
    var digiType, attribute: String?
    var level, playCost, evolutionCost: Int?
    var cardrarity, artist: String?
    var dp: Int?
    var cardnumber, maineffect: String?
    var imageURL: String?
    var isFavourited: Bool?

    enum CodingKeys: String, CodingKey {
        case name, type, color, stage
        case digiType = "digi_type"
        case attribute, level
        case playCost = "play_cost"
        case evolutionCost = "evolution_cost"
        case cardrarity, artist, dp, cardnumber, maineffect
        case imageURL = "image_url"
    }
}

extension Digimon {
    var id: String {
        UUID().uuidString
    }
}
