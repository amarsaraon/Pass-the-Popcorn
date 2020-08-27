//
//  ResultViewController.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/27/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import UIKit
import ChameleonFramework

class ResultViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var returnButton: UIButton!
    
    var correct: Bool?
    var movieTitle: String?
    var filePath = "https://theposterdb.com/api/assets/";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        setUpScreen()
    }
    
    func setUpScreen() {
        if let title = movieTitle {
            if correct! == true {
                correctLabel.text = "Correct!"
                getPoster()
                movieLabel.text = title
                returnButton.setTitle("Play Again", for: .normal)
            } else {
                correctLabel.text = "Incorrect :("
                movieLabel.text = ""
                returnButton.setTitle("Guess Again", for: .normal)
            }
        }
    }

    @IBAction func returnButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func getPoster() {
        if let title = movieTitle {
            let url = URL(string: "https://theposterdb.com/api/assets/\(posterDict[title]!)")
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                if let image = UIImage(data: imageData) {
                    moviePoster.image = image
                    colorBackground(poster: image)
                }
            }
        }
    }
    
    func colorBackground(poster: UIImage) {
        let averageColor = AverageColorFromImage(poster)
        let lighter = averageColor.lighten(byPercentage: 0.2)
        let darker = averageColor.darken(byPercentage: 0.2)
        view.backgroundColor = GradientColor(UIGradientStyle.topToBottom, frame: view.frame, colors: [averageColor, lighter!, darker!])
    }
    
}
