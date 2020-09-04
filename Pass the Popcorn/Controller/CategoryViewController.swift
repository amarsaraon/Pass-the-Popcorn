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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.pickerTransitionName {
            let destinationVC = segue.destination as! PickerViewController
            destinationVC.categoryNum = categoryNumPressed
        }
    }
    
}
    
//MARK: - Table View Loading Methods

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = categoryNames[indexPath.row]
        return cell
    }
    
}

//MARK: - Table View Delegate Methods

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        categoryNumPressed = indexPath.row
        performSegue(withIdentifier: K.pickerTransitionName, sender: self)
    }
    
}
