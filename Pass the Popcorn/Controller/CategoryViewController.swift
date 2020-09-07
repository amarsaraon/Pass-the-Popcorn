//
//  CategoryViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/3/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var categoryNumPressed: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.categoryCellName, bundle: nil), forCellReuseIdentifier: K.categoryCellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.pickerTransitionName {
            let destinationVC = segue.destination as! PickerViewController
            destinationVC.categoryNum = categoryNumPressed
        }
    }
    
    func findProgress(category: Int) -> Float {
        let movies = realm.objects(MovieData.self).filter("category == %@", category)
        var categoriesDone = 0
        for movie in movies {
            if movie.done {
                categoriesDone += 1
            }
        }
        return Float(categoriesDone)/Float(movies.count)
    }
    
}
    
//MARK: - Table View Loading Methods

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryCellIdentifier, for: indexPath) as! CategoryCell
        let category = categoryNames[indexPath.row]
        if 3 >= categoryPoints[category]! { // change "3" to universal points system
            cell.categoryText.text = category
            cell.progressBar.progress = findProgress(category: indexPath.row)
            cell.rightSideImage.image = UIImage(systemName: "arrowtriangle.right.fill")
        } else {
            cell.categoryText.text = category
            cell.progressBar.isHidden = true
            cell.rightSideImage.image = UIImage(systemName: "lock.fill")
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        return cell
    }

}

//MARK: - Table View Delegate Methods

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if 3 >= categoryPoints[categoryNames[indexPath.row]]! {
            categoryNumPressed = indexPath.row
            performSegue(withIdentifier: K.pickerTransitionName, sender: self)
        }
    }
    
}
