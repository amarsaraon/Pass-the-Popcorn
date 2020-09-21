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

    @IBOutlet weak var pointsTextField: UITextField!
    
    var numPressed: Int?
    var categoryNum: Int?
    var categoryList: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryList = listOfMovies[categoryNum!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViewController(vc: self)
        navigationController?.setNavigationBarHidden(false, animated: true)
        pointsTextField.text = "Points from this category: \(findPoints())"
        self.title = "\(categoryNames[categoryNum!])"
        paintSquares()
        roundCorners()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let num = sender.titleLabel?.text {
            numPressed = Int(num)
        }
        if sender.backgroundColor == UIColor.orange {
            performSegue(withIdentifier: K.directResultTransitionName, sender: self)
        } else {
            performSegue(withIdentifier: K.tilesTransitionName, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.tilesTransitionName {
            let destinationVC = segue.destination as! TilesViewController
            destinationVC.movieChosen = categoryList![numPressed! - 1]
        }
        else if segue.identifier == K.directResultTransitionName {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.correct = true
            let mTitle = categoryList![numPressed! - 1].facts[0]
            destinationVC.movieTitle = mTitle
            destinationVC.pointsGained = realm.objects(MovieData.self).filter("movieName == %@", mTitle)[0].pointsGained
            destinationVC.direct = true
        }
    }
    
//MARK: - Prepare Screen Methods
    
    func paintSquares() {
        let movieSquares = realm.objects(MovieData.self).filter("category == %@", categoryNum!)
        for m in movieSquares {
            if m.done == true {
                let t = findTag(name: m.movieName)
                if let button = view.viewWithTag(t) as? UIButton {
                    button.backgroundColor = UIColor.orange
                    button.titleLabel?.textColor = UIColor.gray
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
    
    func roundCorners() {
        for i in 1...25 {
            if let button = view.viewWithTag(i) as? UIButton{
                button.layer.cornerRadius = button.frame.size.height / 10
                button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }
        }
    }
    
    func findPoints() -> Int{
        var pointsFromCategory = 0
        realm.objects(MovieData.self).filter("category == %@", categoryNum!).forEach { m in
            pointsFromCategory += m.pointsGained
        }
        return pointsFromCategory
    }
}
