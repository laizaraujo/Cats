//
//  BreedEndpoint.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import Alamofire

enum BreedEndpoint: ApiConfiguration {
    case listBreeds
    
    var baseUrl: String {
        return "https://api.thecatapi.com/"
    }
    
    var method: HTTPMethod {
        switch self {
        case .listBreeds:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .listBreeds:
            return "v1/breeds"
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var httpBody: Data? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return [
            "x-api-key": "ee73ddc6-a464-49e7-9423-05bc2dc0a26c"
        ]
    }
}
