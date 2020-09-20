//
//  MovieData.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/2/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation
import RealmSwift

class MovieData: Object {
    @objc dynamic var movieName = ""
    @objc dynamic var category = 0
    @objc dynamic var done = false
    @objc dynamic var pointsGained = 0
    
    required convenience init(_ name: String, _ categoryNum: Int) {
        self.init()
        movieName = name
        category = categoryNum
    }
}
