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
    func setImage(with url: URL?) {
        let placeholder = UIImage(named: "cat_placeholder") ?? UIImage()

        guard let imageUrl = url else {
            image = placeholder
            return
        }
        
        af.setImage(withURL: imageUrl, placeholderImage: placeholder, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false) { [weak self] response in
            switch response.result {
            case .failure(let error):
                if !error.isRequestCancelledError {
                    self?.image = UIImage(named: "error_placeholder")
                }
            case .success(let image):
                self?.image = image
            }
        }
    }
}
