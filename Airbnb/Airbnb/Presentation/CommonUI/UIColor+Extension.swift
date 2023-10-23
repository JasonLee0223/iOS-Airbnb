//
//  UIColor+Extension.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

extension UIColor {
    
    enum AirbnbCustomColor {
        case homeMaintitle
        case homeSubtitle
        case homeBadge
        
        var color: UIColor {
            switch self {
            case .homeMaintitle:
                return UIColor(red: 1.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: 1.0)
            case .homeSubtitle:
                return UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            case .homeBadge:
                return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            }
        }
    }
}
