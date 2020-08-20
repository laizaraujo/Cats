//
//  BreedsCollectionViewModel.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation

protocol BreedsCollectionViewModelProtocol: class {
    var populateCell: ((URL?, String, String) -> Void)? { get set }
    func setBreedInformation(image: URL?, name: String, origin: String)
}

class BreedsCollectionViewModel: BreedsCollectionViewModelProtocol {
    var populateCell: ((URL?, String, String) -> Void)?
    
    /// Set Breed information
    /// - Parameters:
    ///     - image: The url that contains breed image
    ///     - title: The breed name
    ///     - subtitle: The breed origin
    func setBreedInformation(image: URL?, name: String, origin: String) {
        populateCell?(image, name, origin)
    }
}
