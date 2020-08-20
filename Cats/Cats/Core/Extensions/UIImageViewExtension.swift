//
//  UIImageViewExtension.swift
//  Cats
//
//  Created by Laiza Souza on 20/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(with url: URL?, placeholderImage: UIImage, errorImage: UIImage) {
        guard let imageUrl = url else {
            image = placeholderImage
            return
        }
        
        af.setImage(withURL: imageUrl, placeholderImage: placeholderImage, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false) { [weak self] response in
            switch response.result {
                case .failure:
                    self?.image = errorImage
                case .success:
                    break
            }
        }
    }
}
