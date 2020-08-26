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
        
        
        for _ in 0...2 {
            addTiles()
        }
        tableView.dataSource = self
        searchTextField.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func addCategoryPressed(_ sender: UIButton) {
        addTiles()
    }
    
    @IBAction func guessPressed(_ sender: UIButton) {
        if movieChosen.facts[0] == searchTextField.text {
            print("Correct!")
            refreshScreen()
            
        } else {
            print("Incorrect :(")
        }
    }
    
    func addTiles() {
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
            }
        }
    }
    
    func refreshScreen() {
        searchTextField.text = ""
        allTilesDone = false
        tiles = [Tile]()
        movieChosen = listOfMovies[1]
        addButton.isEnabled = true
        viewDidLoad()
    }
    
}

//MARK: - Table View Methods

extension TilesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TileCell
        cell.categoryLabel.text = tiles[indexPath.row].category
        cell.descriptionLabel.text = tiles[indexPath.row].description
        cell.changeColor(category: cell.categoryLabel.text!)
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
