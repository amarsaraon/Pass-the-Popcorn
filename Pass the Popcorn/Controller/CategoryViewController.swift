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
    let visionThreshold = 5  // how many points away you need to be to see category title
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.categoryCellName, bundle: nil), forCellReuseIdentifier: K.categoryCellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpViewController(vc: self)
        pointsLabel.text = "Points: \(points)"
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
        if points >= categoryPoints[category]! {
            cell.categoryText.text = category
            cell.progressBar.progress = findProgress(category: indexPath.row)
            cell.progressBar.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
            cell.pointsLabel.isHidden = true
            cell.rightSideImage.image = UIImage(systemName: "arrowtriangle.right.fill")
            cell.selectionStyle = UITableViewCell.SelectionStyle.default
        } else {
            if (categoryPoints[category] ?? 0) - points <= visionThreshold {
                cell.categoryText.text = category
                cell.pointsLabel.textColor = UIColor.black
            }
            else {
                cell.categoryText.text = ""
            }
            cell.pointsLabel.text = "\(categoryPoints[category] ?? 0) points required"
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
        if points >= categoryPoints[categoryNames[indexPath.row]]! {
            categoryNumPressed = indexPath.row
            performSegue(withIdentifier: K.pickerTransitionName, sender: self)
        }
    }
    
}

