//
//  CollectionViewCell.swift
//  Cats
//
//  Created by Laiza Souza on 15/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class BreedsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var breedImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    static let reuseIdentifier = "breed"

    var viewModel: BreedsCollectionViewModelProtocol = BreedsCollectionViewModel()
            
    override func awakeFromNib() {
        super.awakeFromNib()
                
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setCellStyle()
        initializeClosures()
    }
    
    override func prepareForReuse() {
        breedImage.image = nil
    }
    
    /// Closure initialization
    /// - populateCell method
    func initializeClosures() {
        viewModel.populateCell = populateCell(image:title:subtitle:)
    }
    
    private func setCellStyle() {
        layer.cornerRadius = 5

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
    func populateCell(image: Image?, title: String, subtitle: String) {
        if let image = image {
            let aspectRatio = CGFloat(image.height) / CGFloat(image.width)
            breedImage.snp.remakeConstraints { make in
                make.height.equalTo(breedImage.snp.width).multipliedBy(aspectRatio)
            }
        } else {
            breedImage.snp.remakeConstraints { make in
                make.height.equalTo(breedImage.snp.width)
            }
        }

        breedImage.setImage(with: image?.url)
        
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
