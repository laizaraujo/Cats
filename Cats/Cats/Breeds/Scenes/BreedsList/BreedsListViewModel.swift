//
//  BreedsListViewModel.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation

protocol BreedsListViewModelProtocol {
    func loadBreeds()
    
    var breeds: [Breed] { get }
    var breedsUpdated: (() -> Void)? { get set }
    var displayError: ((String) -> Void)? { get set }
    var showLoading: ((Bool) -> Void)? { get set }
}

class BreedsListViewModel: BreedsListViewModelProtocol {
    private var api: BreedApiClientProtocol
    var breeds: [Breed] = [] {
        didSet {
            breedsUpdated?()
        }
    }
    var breedsUpdated: (() -> Void)?
    var displayError: ((String) -> Void)?
    var showLoading: ((Bool) -> Void)?
    
    /// Initialization of BreedsListViewModel
    /// - Parameters:
    ///     - api: The client API
    init(api: BreedApiClientProtocol = BreedApiClient()) {
        self.api = api
    }
    
    /// Load of breeds list
    ///     On Success: save the breeds list object and update the breeds list layout
    ///     On Failure: show failure alert
    func loadBreeds() {
        showLoading?(true)
        api.listBreeds { [weak self] (result) in
            self?.showLoading?(false)
            switch result {
            case .success(let breeds):
                self?.breeds = breeds
            case .failure:
                self?.displayError?("Could not load information")
            }
        }
    }
}
