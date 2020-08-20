//
//  AppDelegate.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = ApplicationCoordinator(window: window)
        self.window = window
        self.applicationCoordinator = appCoordinator
        appCoordinator.start()
        
        return true
    }
}
