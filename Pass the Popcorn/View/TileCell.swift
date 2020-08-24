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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tile.layer.cornerRadius = tile.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
