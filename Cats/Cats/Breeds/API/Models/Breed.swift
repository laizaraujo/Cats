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

    enum CodingKeys: String, CodingKey {
        case adaptability = "adaptability"
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case description = "description"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case id = "id"
        case name = "name"
        case origin = "origin"
        case temperament = "temperament"
    }
    
    func getImageURL() -> URL? {
        let url = "https://api.thecatapi.com/v1/images/search?breed_id=\(id)&format=src&size=small"
        return URL(string: url)
    }
}

struct Weight: Codable {
    let imperial: String
    let metric: String

    enum CodingKeys: String, CodingKey {
        case imperial = "imperial"
        case metric = "metric"
    }
}
