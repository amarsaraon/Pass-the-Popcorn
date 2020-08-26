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
    
    var colorDict = ["Year Released": UIColor.green, "Genre": UIColor.red, "Setting": UIColor.purple, "Actor": UIColor.blue, "Character": UIColor.yellow, "Director": UIColor.orange, "Plot": UIColor.gray, "Quote": UIColor.lightGray, "Tagline": UIColor.darkGray]
    
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
    }
    
}
