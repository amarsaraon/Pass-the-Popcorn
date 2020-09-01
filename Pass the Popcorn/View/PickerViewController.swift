//
//  PickerViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/1/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {

    var numPressed: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let num = sender.titleLabel?.text {
            numPressed = Int(num)
        }
        performSegue(withIdentifier: K.tilesTransitionName, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.tilesTransitionName {
            let destinationVC = segue.destination as! TilesViewController
            destinationVC.movieChosen = listOfMovies[numPressed! - 1]
        }
    }

}
