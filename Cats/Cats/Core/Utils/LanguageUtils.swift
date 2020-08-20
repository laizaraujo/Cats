//
//  LanguageUtils.swift
//  Cats
//
//  Created by Laiza Souza on 20/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import Foundation

public class LanguageUtils {
    public static func getLocalizedString(value: String) -> String {
        let stringValue = Bundle.main.localizedString(forKey: value, value: nil, table: nil)
        
        return stringValue
    }
}
