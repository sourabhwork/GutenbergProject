//
//  CategoryEnum.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 16/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation

enum CategoryEnum {
    case Fiction
    case Drama
    case Humor
    case Politics
    case Philosophy
    case History
    case Adventure
    
    var description: String {
        return "\(self)"
    }
    
    var capitlizedDescription: String {
        return "\(self)".capitalized
    }
}
