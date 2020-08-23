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
    @IBOutlet weak var aspectRatioConstraint: NSLayoutConstraint!
    
    /// Set BreedDetailView Layout
    /// - Parameters:
    ///     - breed: Breed object to show details
    func setInformation(breed: Breed) {
        setLayout()
        
        if let image = breed.image {
            aspectRatioConstraint.isActive = false
            
            let aspectRatio = CGFloat(image.height) / CGFloat(image.width)
            catImage.snp.makeConstraints { (make) in
                make.height.equalTo(catImage.snp.width).multipliedBy(aspectRatio)
            }
        }

        catImage.setImage(with: breed.image?.url)
        
        nameLabel.text = breed.name
        originLabel.text = breed.origin
        temperamentLabel.text = breed.temperament
        descriptionLabel.text = breed.description
        
        insertInfoView(level: breed.affectionLevel, attribute: BreedStrings.affectionLevel.localizable, at: affectionView)
        insertInfoView(level: breed.childFriendly, attribute: BreedStrings.childFriendlyLevel.localizable, at: childFriendlyView)
        insertInfoView(level: breed.energyLevel, attribute: BreedStrings.energyLevel.localizable, at: energyLevelView)
        insertInfoView(level: breed.adaptability, attribute: BreedStrings.adaptabilityLevel.localizable, at: adaptabilityView)
    }
    
    /// Initialize the InfoView to show attribute
    /// - Parameters:
    ///     - level: The level of intensity
    ///     - attribute: The attribute name
    ///     - view: View where the component should be inserted
    private func insertInfoView(level: Int, attribute: String, at view: UIView) {
        let infoView: InfoView = InfoView.fromNib()
        infoView.setInformation(level: level, attribute: attribute)

        view.addSubview(infoView)
        infoView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    /// Sets the view elements layout
    private func setLayout() {
        nameLabel.textColor = UIColor.Theme.secondary0
        originLabel.textColor = UIColor.Theme.secondary0
        temperamentLabel.textColor = UIColor.Theme.secondary0
        descriptionLabel.textColor = UIColor.Theme.secondary0
    }
    
}
