//
//  Restaurant.swift
//  FoodPin
//
//  Created by Simon Ng on 20/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var jobType = ""
    var type = ""
    var location = ""
    var jobDescription = ""
    var image = ""
    var isVisited = false
    var rating = ""
    
    init(name:String, jobType:String, type:String, location:String, jobDescription:String, image:String, isVisited:Bool) {
        self.name = name
        self.jobType = jobType
        self.type = type
        self.location = location
        self.jobDescription = jobDescription
        self.image = image
        self.isVisited = isVisited
    }
}

