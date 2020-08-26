//
//  ViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/24/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class TilesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var tiles = [Tile]()
    var movieChosen = listOfMovies[0]
    var allTilesDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        searchTextField.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func addCategoryPressed(_ sender: UIButton) {
        if allTilesDone == false {
            var tileCategory: String
            var tileDescription: String
            var isDone: Bool
            (tileCategory, tileDescription, isDone) = movieChosen.pickTile()
            let newTile = Tile(category: tileCategory, description: tileDescription)
            tiles.insert(newTile, at: 0)
            tableView.reloadData()
            if isDone == true {
                allTilesDone = true
                addButton.isEnabled = false
                //addButton.isHidden = true
                addButton.alpha = 0.5
            }
        }
    }
    
    @IBAction func guessPressed(_ sender: UIButton) {
        if movieChosen.facts[0] == searchTextField.text {
            print("Correct!")
        } else {
            print("Incorrect :(")
        }
    }
    
}

//MARK: - Table View Methodsw

extension TilesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TileCell
        cell.categoryLabel.text = tiles[indexPath.row].category
        cell.descriptionLabel.text = tiles[indexPath.row].description
        return cell
    }
    
}

//MARK: - Text Field Methods/Segue

extension TilesViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        performSegue(withIdentifier: K.resultTransitionName, sender: self)
        textField.resignFirstResponder()
    }
    
}

//MARK: - Receive Data Protocol

protocol isAbleToReceiveData {
  func pass(data: String)
}

extension TilesViewController: isAbleToReceiveData {
    
    func pass(data: String) {
        searchTextField.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.resultTransitionName {
            let desitationVC = segue.destination as! SearchViewController
            desitationVC.delegate = self
        }
    }
    
}
