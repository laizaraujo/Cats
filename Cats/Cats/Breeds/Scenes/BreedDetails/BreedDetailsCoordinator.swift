//
//  BreedDetailsCoordinator.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class BreedDetailsCoordinator: Coordinator {
    private var presenter: UINavigationController
    private var breed: Breed
    
    /// Initialization of BreedDetailsCoordinator
    /// - Parameters:
    ///     - presenter: The navigation controller  `UINavigationController`
    ///     - breed: The Breed object
    init(presenter: UINavigationController, breed: Breed) {
        self.presenter = presenter
        self.breed = breed
    }
    
    /// Start BreedDetailsViewController
    func start() {
        let viewController = BreedDetailsViewController()
        viewController.breed = breed
        presenter.pushViewController(viewController, animated: true)
    }
    
    /// Remove BreedDetailsViewController
    func popView() {
        presenter.popViewController(animated: true)
    }
}
