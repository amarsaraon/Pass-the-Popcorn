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
        let movieSquares = realm.objects(MovieData.self)
        for m in movieSquares {
            if m.done == true {
                let t = findTag(name: m.movieName)
                if let button = view.viewWithTag(t) as? UIButton {
                    button.backgroundColor = UIColor.red
                    button.isEnabled = false
                }
            }
        }
    }
    
    func findTag(name: String) -> Int {
        for i in 1...listOfMovies.count{
            if listOfMovies[i - 1].facts[0] == name {
                return i
            }
        }
        fatalError("Cannot movie tag")
    }
}
