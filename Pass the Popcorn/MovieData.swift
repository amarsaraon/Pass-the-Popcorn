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
    @objc dynamic var done = false
    
    required convenience init(_ name: String) {
        self.init()
        movieName = name
    }
}
