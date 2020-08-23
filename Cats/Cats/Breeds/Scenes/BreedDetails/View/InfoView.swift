//
//  InfoView.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class InfoView: UIStackView {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoLevel: UIView!
    
    /// Set InfoView Information
    /// - Parameters:
    ///     - level:The intensity level of attribute
    ///     - attribute: The attribute name
    func setInformation(level: Int, attribute: String) {
        setLayout()
        infoLabel.text = attribute
        let levelView: LevelView = LevelView.fromNib()
        levelView.setIntensityLevel(level: level)
        
        infoLevel.addSubview(levelView)
        levelView.snp.makeConstraints { (make) in
            make.edges.equalTo(infoLevel)
        }
    }
    
    /// Sets elements layout
    private func setLayout() {
        infoLabel.textColor = UIColor.Theme.secondary0
    }
}
