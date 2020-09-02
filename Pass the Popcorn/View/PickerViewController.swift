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
    let realm = try! Realm()
    
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
    
    //MARK: - Load Movies Method
    
    func loadMovies(realmMovies: Results<MovieData>) {
        for movie in listOfMovies {
            let movieNames = realmMovies.filter("movieName == %@", movie.facts[0])
            if movieNames.count == 0 {
                do {
                    try realm.write {
                        realm.add(MovieData(movie.facts[0]))
                    }
                } catch {
                    print("Error adding movies to realm, \(error)")
                }
            }
        }
        for movie in realm.objects(MovieData.self) {
            doneDict[movie.movieName] = movie.done
        }
    }
    
    func paintSquares() {
        for i in 0...doneDict.count - 1 {
            print(doneDict[listOfMovies[i].facts[0]])
            if doneDict[listOfMovies[i].facts[0]] == true {
                if let button = view.viewWithTag(i) as? UIButton {
                    button.backgroundColor = UIColor.red
                    button.isEnabled = false
                }
                
            }
        }
    }
}
