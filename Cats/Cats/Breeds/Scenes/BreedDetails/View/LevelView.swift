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
        
    /// Display LevelView
    /// - Parameters:
    ///     - superView: View where InfoView will be displayed
    ///     - level: The intensity level of attribute
    static func display(at superView: UIView, with level: Int) {
        let levelView: LevelView = LevelView.fromNib()
        levelView.setIntensityLevel(level: level)
        
        superView.addSubview(levelView)
        
        levelView.translatesAutoresizingMaskIntoConstraints = false
        levelView.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        levelView.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        levelView.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        levelView.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        
    }
    
    /// Set intensity level
    /// - Parameters:
    ///     - level: The intensity level of attribute
    func setIntensityLevel(level: Int) {
        for i in level..<5 {
            levelViews[i].alpha = 0.0
        }
    }
}
