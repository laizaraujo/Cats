//
//  BreedDetailsViewController.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class BreedDetailsViewController: UIViewController {
    var breed: Breed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Theme.primary
        
        guard let breed = breed else { return }
        BreedDetailView.display(at: view, with: breed)
    }

}
