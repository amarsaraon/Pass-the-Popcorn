//
//  Movie.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/26/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation

let movieCategories = ["Title", "Year Released", "Genre", "Genre", "Setting", "Actor", "Actor", "Actor", "Character", "Character", "Character", "Plot", "Quote", "Tagline"]

struct Movie {
    
    var facts = [String]()
    var nums = Array(1...13)
    var n = 0
    var isDone = false
    
    init(t: String, y: String, g1: String, g2: String, s: String, a1: String, a2: String, a3: String, c1: String, c2: String, c3: String, p: String, q: String, tg: String) {
        facts.append(t)
        facts.append(y)
        facts.append(g1)
        facts.append(g2)
        facts.append(s)
        facts.append(a1)
        facts.append(a2)
        facts.append(a3)
        facts.append(c1)
        facts.append(c2)
        facts.append(c3)
        facts.append(p)
        facts.append(q)
        facts.append(tg)
    }
 
    mutating func pickTile() -> (String, String, Bool) {
        if isDone == false {
            if let index = nums.randomElement() {
                nums.removeAll(where: { $0 == index } )
                isDone = !(nums.count > n)
                return (movieCategories[index], self.facts[index], isDone)
            }
        }
        return ("", "", true)
    }
    
}
