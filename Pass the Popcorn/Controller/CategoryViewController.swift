//
//  CategoryViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/3/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.pickerTransitionName, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.pickerTransitionName {
            let destinationVC = segue.destination as! PickerViewController
            destinationVC.categoryList = listOfMovies[2]
        }
    }
    
}
