//
//  TileData.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/8/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation
import RealmSwift

let tilesShown = 12

class TileData: Object {
    @objc dynamic var movieName = ""
    dynamic var tilesAvailable = Array(1...13)
    dynamic var tilesChosen = List<Int>()
    @objc dynamic var isDone = false
    
    required convenience init(_ name: String) {
        self.init()
        movieName = name
        for _ in 0...2 {
            let tileNum = tilesAvailable.randomElement()
            tilesChosen.append(tileNum!)
            tilesAvailable.removeAll(where: { $0 == tileNum })
        }
    }
    
    func pickTile() {
        if isDone == false {
            let tileNum = tilesAvailable.randomElement()
            do {
                try realm!.write {
                    tilesChosen.append(tileNum!)
                    tilesAvailable.removeAll(where: { $0 == tileNum })
                    if tilesChosen.count >= tilesShown {
                        isDone = true
                    }
                }
            } catch {
                print("Error adding picking tile in realm, \(error)")
            }

        }
    }
}
