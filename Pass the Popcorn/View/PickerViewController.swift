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
    var categoryNum: Int?
    var categoryList: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryList = listOfMovies[categoryNum!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(points)
        navigationController?.setNavigationBarHidden(false, animated: true)
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
            destinationVC.movieChosen = categoryList![numPressed! - 1]
        }
    }
    
    func paintSquares() {
        let movieSquares = realm.objects(MovieData.self).filter("category == %@", categoryNum!)
        for m in movieSquares {
            if m.done == true {
                let t = findTag(name: m.movieName)
                if let button = view.viewWithTag(t) as? UIButton {
                    button.isEnabled = false
                    button.backgroundColor = UIColor.green
                }
            }
        }
    }
    
    func findTag(name: String) -> Int {
        for i in 1...categoryList!.count{
            if categoryList![i - 1].facts[0] == name {
                return i
            }
        }
        fatalError("Cannot movie tag")
    }
}
