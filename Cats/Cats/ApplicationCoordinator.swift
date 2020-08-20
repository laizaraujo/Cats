//
//  ApplicationCoordinator.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private var firstSceneCoordinator: BreedsListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.firstSceneCoordinator = BreedsListCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        firstSceneCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    func popView() {
        
    }
}
