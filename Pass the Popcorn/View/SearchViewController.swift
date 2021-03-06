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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchBar.becomeFirstResponder()
        movieTable.dataSource = self
        movieTable.delegate = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViewController(vc: self)
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
            if text.count >= 1 {
                movieList = fullMovieList.filter { $0.localizedStandardContains(text) }
                movieList = sortMovieList(movieList: movieList)
                //movieList = movieList.sorted { $0.lowercased() < $1.lowercased() }
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

func sortMovieList(movieList: [String]) ->  [String]{
    var sortedList = movieList
    var wordsDict = [String: String]()
    print(sortedList.count)
    for i in 0...sortedList.count - 1 { // removes prefixes from list and places them in the dictionary
        if sortedList[i].prefix(4) == "The " {
            sortedList[i] = String(movieList[i].suffix(sortedList[i].count - 4))
            wordsDict[sortedList[i]] = "The "
        } else if sortedList[i].prefix(2) == "A " {
            sortedList[i] = String(movieList[i].suffix(sortedList[i].count - 2))
            wordsDict[sortedList[i]] = "A "
        } else if sortedList[i].prefix(3) == "An " {
            sortedList[i] = String(movieList[i].suffix((sortedList[i].count - 3)))
            wordsDict[sortedList[i]] = "An "
        }
    }
    sortedList = sortedList.sorted { $0.lowercased() < $1.lowercased() }
    for i in 0...sortedList.count - 1{ // adds the prefixes back to list
        let prefix = wordsDict[sortedList[i]]
        if (prefix != nil) {
            sortedList[i] = prefix! + sortedList[i]
        }
    }
    return sortedList
}
