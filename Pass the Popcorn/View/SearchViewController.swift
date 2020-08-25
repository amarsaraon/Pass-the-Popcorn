//
//  SearchViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/25/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var movieGuessedText: UITextField!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTable: UITableView!
    
    var delegate: isAbleToReceiveData?
    
    var movieList = ["Back to the Future", "Se7en"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTable.dataSource = self
        movieTable.delegate = self
        searchBar.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let movie = movieGuessedText.text {
            delegate!.pass(data: movie)
        }
    }

    @IBAction func checkPressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("hello")
        }
    }
    
}

//MARK: - Table View Data Source Methods

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = movieList[indexPath.row]
        return cell
    }
    
}

//MARK: - Table View Delegate Methods

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieGuessedText.text = movieList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - Search Bar Methods

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
}
