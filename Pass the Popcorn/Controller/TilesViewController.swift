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
    @IBOutlet weak var guessButton: UIButton!
    
    var movieChosen: Movie?
    var tileDataChosen: TileData?
    var tiles = [Tile]()
    var isCorrect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTiles()
        tableView.dataSource = self
        searchTextField.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViewController(vc: self)
        navigationController?.setNavigationBarHidden(false, animated: true)
        searchTextField.text = ""
        guessButton.isEnabled = false
    }
    
    @IBAction func guessPressed(_ sender: UIButton) {
        if let title = movieChosen?.facts[0] {
            if searchTextField.text == title{
                //print("Correct!")
                isCorrect = true
                points += pointsDict[(tileDataChosen?.tilesChosen.count)!] ?? 0
                defaults.set(points, forKey: K.pointsKey)
                updateMovies(movieName: title)
                performSegue(withIdentifier: K.resultTransitionName, sender: self)
                deleteTileData(movieName: title)
            } else {
                //print("Incorrect :(")
                performSegue(withIdentifier: K.resultTransitionName, sender: self)
            }
        }
    }

    //MARK: - Add Tiles Categories
    
    @IBAction func addCategoryPressed(_ sender: UIButton) {
        tileDataChosen?.pickTile()
        addTileData()
    }

    func addTiles() {
        let tileData = realm.objects(TileData.self).filter("movieName == %@", movieChosen!.facts[0])
        if tileData.count == 0 {
            do {
                try realm.write {
                    tileDataChosen = TileData(movieChosen!.facts[0])
                    realm.add(tileDataChosen!)
                }
            } catch {
                print("Error adding tile data to realm, \(error)")
            }
        } else {
            tileDataChosen = tileData[0]
        }
        addTileData()
    }
    
    func addTileData() {
        tiles.removeAll()
        tileDataChosen!.tilesChosen.forEach { (i) in
            tiles.append(Tile(category: movieCategories[i], description: (movieChosen?.facts[i])!))
        }
        tableView.reloadData()
        if tileDataChosen?.isDone == true {
            addButton.isEnabled = false
        }
    }
    
    func deleteTileData(movieName: String) {
        do {
            try realm.write {
                realm.delete(tileDataChosen!)
            }
        } catch {
            print("Error deleting tile data, \(error)")
        }
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
        if cell.categoryLabel.text == "Quote" {
            cell.descriptionLabel.text = "\"\(tiles[indexPath.row].description)\""
        } else {
            cell.descriptionLabel.text = "\(tiles[indexPath.row].description)"
        }
        
        cell.changeColor(category: cell.categoryLabel.text!)
        return cell
    }
    
}

//MARK: - Text Field Methods/Segue

extension TilesViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        performSegue(withIdentifier: K.searchTransitionName, sender: self)
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
        if searchTextField.text != "" {
            guessButton.isEnabled = true
        } else {
            guessButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.searchTransitionName {
            let desitationVC = segue.destination as! SearchViewController
            desitationVC.delegate = self
        } else if segue.identifier == K.resultTransitionName {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.correct = isCorrect
            destinationVC.movieTitle = movieChosen!.facts[0]
            destinationVC.pointsGained = pointsDict[(tileDataChosen?.tilesChosen.count)!] ?? 0
        }
    }
    
}

