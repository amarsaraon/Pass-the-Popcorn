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
    
    var tiles: [Tile] = [
        Tile(category: "Actor", description: "Michael J. Fox"),
        Tile(category: "Plot", description: "A 17-year-old high school student is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend."),
        Tile(category: "Setting", description: "1955; Hill Valley, California")
    ]
    
    var newTile = Tile(category: "Genre", description: "Adventure")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        searchTextField.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func addCategoryPressed(_ sender: UIButton) {
        tiles.append(newTile)
        tableView.reloadData()
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
