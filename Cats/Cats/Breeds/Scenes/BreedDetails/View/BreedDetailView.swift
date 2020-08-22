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
        
        initInfoView(level: breed.affectionLevel, attribute: BreedStrings.affectionLevel.localizable, at: affectionView)
        initInfoView(level: breed.childFriendly, attribute: BreedStrings.childFriendlyLevel.localizable, at: childFriendlyView)
        initInfoView(level: breed.energyLevel, attribute: BreedStrings.energyLevel.localizable, at: energyLevelView)
        initInfoView(level: breed.adaptability, attribute: BreedStrings.adaptabilityLevel.localizable, at: adaptabilityView)
    }
    
    private func initInfoView(level: Int, attribute: String, at view: UIView) {
        let infoView: InfoView = InfoView.fromNib()
        infoView.setInformation(level: level, attribute: attribute)

        view.addSubview(infoView)
        infoView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    private func setLayout() {
        nameLabel.textColor = UIColor.Theme.secondary0
        originLabel.textColor = UIColor.Theme.secondary0
        temperamentLabel.textColor = UIColor.Theme.secondary0
        descriptionLabel.textColor = UIColor.Theme.secondary0
    }
    
}
