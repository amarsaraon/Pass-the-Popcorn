//
//  CategoryCell.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/7/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var rightSideImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
