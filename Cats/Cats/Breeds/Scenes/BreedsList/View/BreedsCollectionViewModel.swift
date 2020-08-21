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
    func setBreed(_ breed: Breed)
}

class BreedsCollectionViewModel: BreedsCollectionViewModelProtocol {
    var populateCell: ((URL?, String, String) -> Void)?
    
    /// Set Breed information
    /// - Parameters:
    ///     - breed: The breed model
    func setBreed(_ breed: Breed) {
        populateCell?(breed.getImageURL(), breed.name, breed.origin)
    }
}
