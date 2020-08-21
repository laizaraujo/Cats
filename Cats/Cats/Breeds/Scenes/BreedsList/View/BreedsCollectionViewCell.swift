//
//  CollectionViewCell.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class BreedsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var breedImage: UIImageView! {
        didSet {
            breedImage.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var viewModel: BreedsCollectionViewModelProtocol = BreedsCollectionViewModel()
            
    override func awakeFromNib() {
        super.awakeFromNib()
                
        contentView.translatesAutoresizingMaskIntoConstraints = false
        initializeClosures()
    }
    
    /// Closure initialization
    /// - populateCell method
    func initializeClosures() {
        viewModel.populateCell = populateCell(image:title:subtitle:)
    }
    
    private func setCellStyle() {
        titleLabel.textColor = UIColor.Theme.secondary1
        subtitleLabel.textColor = UIColor.Theme.secondary1
    }
}

extension BreedsCollectionViewCell {
    
    /// Populate cell information
    /// - Parameters:
    ///     - image: The url that contains breed image
    ///     - title: The cell title
    ///     - subtitle: The cell subtitle
    func populateCell(image: URL?, title: String, subtitle: String) {
        setCellStyle()
        let placeholder = UIImage(named: "cat_placeholder")
        if let imageURL = image {
            breedImage.af.setImage(withURL: imageURL, placeholderImage: placeholder, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false)
        } else {
            breedImage.image = placeholder
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
