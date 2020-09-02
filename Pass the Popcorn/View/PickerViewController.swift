//
//  PickerViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/1/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit
import RealmSwift

class PickerViewController: UIViewController {

    var numPressed: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let realmMovies = realm.objects(MovieData.self)
        loadMovies(realmMovies: realmMovies)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        paintSquares()
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
    
    func paintSquares() {
        for i in 0...doneDict.count - 1 {
            print(doneDict[listOfMovies[i].facts[0]])
            if doneDict[listOfMovies[i].facts[0]] == true {
                if let button = view.viewWithTag(i) as? UIButton {
                    button.backgroundColor = UIColor.red
                    button.isEnabled = false
                    //button.titleLabel?.text = "✓"
                }
            }
        }
    }
}
