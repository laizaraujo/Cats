//
//  InfoView.swift
//  Cats
//
//  Created by Laiza Souza on 16/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import UIKit

class InfoView: UIStackView {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoLevel: UIView!
    
    /// Display InfoView
    /// - Parameters:
    ///     - superView: View where InfoView will be displayed
    ///     - level: The intensity level of attribute
    ///     - attribute: The attribute name
    static func display(at superView: UIView, with level: Int, for attribute: String) {
        let infoView: InfoView = InfoView.fromNib()
        infoView.setInformation(level: level, attribute: attribute)
        
        superView.addSubview(infoView)
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        infoView.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    /// Set InfoView Information
    /// - Parameters:
    ///     - level:The intensity level of attribute
    ///     - attribute: The attribute name
    func setInformation(level: Int, attribute: String) {
        infoLabel.text = attribute
        LevelView.display(at: infoLevel, with: level)
    }
}
