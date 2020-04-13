//
//  Colors.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 4/5/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

// ["restaurant","trip","coffee","beach","camping","home"]

struct MyThemeColors {
    static let cardsColors: [String:Color] = [
        "restaurant" : Color(.systemIndigo),
        "trip" : Color(.systemGreen),
        "coffee" : Color(.systemBlue),
        "beach" : Color(.systemPurple),
        "camping" : Color(.systemOrange),
        "home" : Color(.systemPink)
    ]
    
    static let themeColors: [String:Color] = [
       "Pink" : Color(.systemPink),
       "Blue" : Color(.systemBlue),
       "Purple" : Color(.systemPurple),
       "Green" : Color(.systemGreen),
       "Gray" : Color(.systemGray)
    ]

    static let themeColors2: [Color] = [
       Color(.systemPink),
       Color(.systemBlue),
       Color(.systemPurple),
       Color(.systemGreen),
       Color(.systemGray)
    ]
}

