//
//  LevelView.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import UIKit

class LevelView: UIStackView {
    
    @IBOutlet var levelViews: [UIView]!
    
    /// Set intensity level
    /// - Parameters:
    ///     - level: The intensity level of attribute
    func setIntensityLevel(level: Int) {
        for i in 0..<5 {
            levelViews[i].alpha = i <= level - 1 ? 1 : 0
        }
    }

}
