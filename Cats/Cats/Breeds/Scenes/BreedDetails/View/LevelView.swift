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
        levelView.snp.makeConstraints { (make) in
            make.edges.equalTo(superView)
        }
    }
    
    /// Set intensity level
    /// - Parameters:
    ///     - level: The intensity level of attribute
    func setIntensityLevel(level: Int) {
        for i in 0..<5 {
            levelViews[i].alpha = i <= level - 1 ? 1 : 0
        }
    }
}
