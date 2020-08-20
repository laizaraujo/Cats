//
//  BreedDetailView.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class BreedDetailView: UIView {
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var affectionView: UIView!
    @IBOutlet weak var childFriendlyView: UIView!
    @IBOutlet weak var energyLevelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var adaptabilityView: UIView!
    
    let loadView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.backgroundColor = .clear
        loader.color = .white
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        return loader
    }()
    
    /// Display BreedDetailView
    /// - Parameters:
    ///     - superView: The view where BreedDetailView should be displayed
    ///     - breed: The Breed object to be shown
    static func display(at superView: UIView,  with breed: Breed) {
        let detail: BreedDetailView = BreedDetailView.fromNib()
        detail.setLayout(breed: breed)
        
        superView.addSubview(detail)
    }
    
    /// Set BreedDetailView Layout
    /// - Parameters:
    ///     - breed: Breed object to show details
    func setLayout(breed: Breed) {
        if let imageURL = breed.getImageURL() {
            let placeholder = UIImage(named: "cat_placeholder") ?? UIImage()
            let error = UIImage(named: "") ?? UIImage()
            catImage.setImage(with: imageURL, placeholderImage: placeholder, errorImage: error)
        }
        
        nameLabel.text = breed.name
        originLabel.text = breed.origin
        temperamentLabel.text = breed.temperament
        descriptionLabel.text = breed.description
        
        InfoView.display(at: affectionView,
                         with: breed.affectionLevel,
                         for: LanguageUtils.getLocalizedString(value: "affection_level"))
        InfoView.display(at: childFriendlyView,
                         with: breed.childFriendly,
                         for: LanguageUtils.getLocalizedString(value: "child_friendly_level"))
        InfoView.display(at: energyLevelView,
                         with: breed.energyLevel,
                         for: LanguageUtils.getLocalizedString(value: "energy_level"))
        InfoView.display(at: adaptabilityView,
                         with: breed.adaptability,
                         for: LanguageUtils.getLocalizedString(value: "adaptability_level"))
    }
}
