//
//  UIColorExtension.swift
//  Cats
//
//  Created by Laiza Souza on 20/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

extension UIColor {
    
    public struct Theme {
        public static var primary: UIColor { return UIColor(named: "primary") ?? UIColor() } // #202331
        public static var secondary0: UIColor { return UIColor(named: "secondary0") ?? UIColor() } // #AAAAAA
        public static var secondary1: UIColor { return UIColor(named: "secondary1") ?? UIColor() } // #AAAAAA

    }
}
