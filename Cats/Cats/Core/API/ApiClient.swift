//
//  ApiClient.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient {
    public func performRequest<T: Decodable>(
        route: URLRequestConvertible,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(route)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let body):
                    completion(.success(body))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
