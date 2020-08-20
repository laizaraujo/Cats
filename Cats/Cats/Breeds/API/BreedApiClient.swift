//
//  BreedApiClient.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import Alamofire

protocol BreedApiClientProtocol {
    func listBreeds(completion: @escaping (Result<[Breed], Error>) -> Void)
}

class BreedApiClient: ApiClient, BreedApiClientProtocol {
    func listBreeds(completion: @escaping (Result<[Breed], Error>) -> Void) {
        performRequest(route: BreedEndpoint.listBreeds, completion: completion)
    }
}
