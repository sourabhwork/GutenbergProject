//
//  ColorsEnum.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 13/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation
import UIKit

enum ColorEnum {
    case CusomDarkGray
    case CustomBlue
    case CustomGrey
    case CustomLightGrey
    case CustomPurple
        
    func getColor()->UIColor {
        switch self {
        case .CusomDarkGray:
            return UIColor(named: "CustomDarkGray") ?? UIColor()
        case .CustomBlue:
            return UIColor(named: "CustomBlue") ?? UIColor()
        case .CustomGrey:
            return UIColor(named: "CustomGrey") ?? UIColor()
        case .CustomLightGrey:
            return UIColor(named: "CustomLightGrey") ?? UIColor()
        case .CustomPurple:
            return UIColor(named: "CustomPurple") ?? UIColor()
        }
    }
}
