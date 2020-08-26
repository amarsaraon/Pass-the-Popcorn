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
    
    var movieList = [String]()
    
    var fullMovieList = ["Back to the Future", "Se7en", "Die Hard", "Star Wars: Episode IV - A New Hope", "Star Wars: Episode V - The Empire Strikes Back", "Star Wars: Episode V - Return of the Jedi", "Blade Runner", "Alien", "Life of Brian", "Parasite", "Taxi Driver", "Her", "Hereditary", "The Matrix", "There Will Be Blood", "WALL-E", "Do the Right Thing", "Psycho", "Get Out", "Galaxy Quest", "Toy Story", "Toy Story 2", "Toy Story 3", "Toy Story 4", "Ex Machina", "Jaws", "The Incredibles", "21 Jump Street", "The Big Short", "Goodfellas", "Holes", "Fargo", "Uncut Gems", "Dunkirk", "Black Hawk Down", "Spotlight", "The Dark Knight", "Tropic Thunder", "Inception", "Coco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchBar.becomeFirstResponder()
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
        self.dismiss(animated: true, completion: nil)
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            if text.count >= 2 {
                movieList = fullMovieList.filter { $0.localizedStandardContains(text) }
                movieList = movieList.sorted { $0.lowercased() < $1.lowercased() }
                movieTable.reloadData()
                searchBar.resignFirstResponder()
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            movieList = []
            movieTable.reloadData()
        }
    }
    
}
