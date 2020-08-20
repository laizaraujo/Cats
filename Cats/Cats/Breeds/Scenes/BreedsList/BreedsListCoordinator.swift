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
    /// - background color
    /// - tint color
    /// - traslucid
    /// - remove shadow image
    func setNavigationBarLayout() {
        presenter.navigationBar.barTintColor = UIColor.Theme.primary
        presenter.navigationBar.tintColor = .white
        presenter.navigationBar.isTranslucent = false
        presenter.navigationBar.shadowImage = UIImage()
    }
    
    /// Start BreedsViewController
    /// - initialize controller
    /// - set its delegate
    /// - push controller
    func start() {
        let viewController = BreedsListViewController()
        viewController.delegate = self
        presenter.pushViewController(viewController, animated: true)
    }
    
    /// Remove BreedsViewController
    /// - pop controller
    func popView() {
        presenter.popViewController(animated: true)
    }
}

extension BreedsListCoordinator: BreedsListViewControllerProtocol {
    /// Start BreedDetailsCoordinator
    /// - Parameters:
    ///     - breed: Breed object to be listed
    func navigateToDetails(breed: Breed) {
        let detailCoordinator = BreedDetailsCoordinator(presenter: presenter, breed: breed)
        detailCoordinator.start()
    }
}
