//
//  LanguageUtils.swift
//  Cats
//
//  Created by Laiza Souza on 20/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation
import UIKit

public class LanguageUtils {
    public static func getLocalizedString(value: String) -> String {
        let stringValue = Bundle.main.localizedString(forKey: value, value: nil, table: nil)
        
        return stringValue
    }
}

enum BreedStrings: String {
    case appName = "app_name"
    case affectionLevel = "affection_level"
    case childFriendlyLevel = "child_friendly_level"
    case energyLevel = "energy_level"
    case adaptabilityLevel = "adaptability_level"
    
    var localizable: String {
        return LanguageUtils.getLocalizedString(value: rawValue)
    }

}
