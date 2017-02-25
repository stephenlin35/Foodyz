//
//  Restaurant.swift
//  Foodyz
//
//  Created by Stephen Lin on 2/21/17.
//  Copyright © 2017 Stephen Lin. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var location = ""
    var type = ""
    var image = ""
    var isVisited = false
    
    init(name: String, location: String, type: String, image: String, isVisited: Bool) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.isVisited = isVisited
    }
}