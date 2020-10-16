//
//  FontsEnum.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 13/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation
import UIKit


enum MontserratEnum: String {
    case SemiBold = "SemiBold"
    case Regular = "Regular"
    
    func size(size: CGFloat) -> UIFont? {        
        switch self {
        case .Regular:
            if let font = UIFont(name: FontConstant.regularFont, size: size) {
                return font
            }
        case .SemiBold:
            if let font = UIFont(name: FontConstant.customSemiBoldFont, size: size) {
                return font
            }
        }
        return UIFont()
    }
        
}
