//
//  BreedsListCoordinator.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class BreedsListCoordinator: Coordinator {
    private var presenter: UINavigationController
    
    /// Initialization of BreedsListCoordinator
    /// - Parameters:
    ///     - presenter: The navigation controller  `UINavigationController` 
    init(presenter: UINavigationController) {
        self.presenter = presenter
        setNavigationBarLayout()
    }
    
    /// Sets the  navigation bar style
    func setNavigationBarLayout() {
        presenter.navigationBar.barTintColor = UIColor.Theme.primary
        presenter.navigationBar.tintColor = UIColor.Theme.secondary0
        presenter.navigationBar.isTranslucent = false
        presenter.navigationBar.shadowImage = UIImage()
    }
    
    /// Start BreedsViewController
    func start() {
        let viewController = BreedsListViewController()
        viewController.viewModel = BreedsListViewModel()
        viewController.delegate = self
        presenter.pushViewController(viewController, animated: true)
    }
    
    /// Remove BreedsViewController
    func popView() {
        presenter.popViewController(animated: true)
    }
}

// MARK: BreedsListViewControllerProtocol
extension BreedsListCoordinator: BreedsListViewControllerProtocol {
    /// Start BreedDetailsCoordinator
    /// - Parameters:
    ///     - breed: Breed object to be listed
    func navigateToDetails(breed: Breed) {
        let detailCoordinator = BreedDetailsCoordinator(presenter: presenter, breed: breed)
        detailCoordinator.start()
    }
}
