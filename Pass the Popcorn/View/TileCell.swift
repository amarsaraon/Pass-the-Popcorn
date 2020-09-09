//
//  TileCell.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/24/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class TileCell: UITableViewCell {

    @IBOutlet weak var tile: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var colorDict = ["Year Released": UIColor.flatGreenDark(), "Genre": UIColor.flatRedDark(), "Setting": UIColor.purple, "Actor": UIColor.blue, "Character": UIColor.yellow, "Director": UIColor.darkGray, "Plot": UIColor.black, "Quote": UIColor.white]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tile.layer.cornerRadius = tile.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func changeColor(category: String) {
        //tile.backgroundColor = colorDict[category]
        tile.backgroundColor = UIColor.orange
        //self.categoryLabel.textColor = colorDict[category]
    }
    
}
