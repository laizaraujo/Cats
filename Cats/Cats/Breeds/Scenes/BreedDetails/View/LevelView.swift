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
    
    func setLayout(for level: Int) {
        for i in 0...level {
            levelViews[i].isHidden = false
        }
    }
}
