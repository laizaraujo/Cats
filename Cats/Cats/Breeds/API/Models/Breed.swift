//
//  Breed.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation

struct Breed: Codable {
    let adaptability: Int
    let affectionLevel: Int
    let childFriendly: Int
    let description: String
    let dogFriendly: Int
    let energyLevel: Int
    let id: String
    let name: String
    let origin: String
    let temperament: String
    var image: Image?

    enum CodingKeys: String, CodingKey {
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case description
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case id
        case name
        case origin
        case temperament
        case image
    }
}
