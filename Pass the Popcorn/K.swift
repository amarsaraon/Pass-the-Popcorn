//
//  K.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/24/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation

struct K {
    
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "TileCell"
    static let categoryCellIdentifier = "CategoryReusableCell"
    static let categoryCellName = "CategoryCell"
    static let searchTransitionName = "goToSearch"
    static let resultTransitionName = "goToResult"
    static let tilesTransitionName = "goToTiles"
    static let pickerTransitionName = "goToPicker"
    
    struct ResultButtonLabels {
        static let playAgain = "Play Again"
        static let guessAgain = "Guess Again"
    }

}
