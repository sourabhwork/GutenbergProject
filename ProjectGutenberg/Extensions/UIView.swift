//
//  UIView.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 14/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
       
    func addShadowToView() {
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        //self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowColor = UIColor(red: 211, green: 209, blue: 238, alpha: 0.5).cgColor
        self.layer.shadowRadius = 3.0
    }
    
    func addBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func setRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}



