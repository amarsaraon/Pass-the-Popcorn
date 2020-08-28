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
    var allMoviesChosen: Bool?
    let filePath = "https://theposterdb.com/api/assets/";
    var moviePosterImage: UIImage?
    var backgroundColor: UIColor?
    
    var delegate: isAbleToRefreshScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        getPoster()
        setUpScreen()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.clearTextFieldSearch()
        if correct == true {
            delegate?.refreshScreen()
        }
    }
    
    func setUpScreen() {
        if let title = movieTitle {
            if correct! == true {
                correctLabel.text = "Correct!"
                movieLabel.text = title
                if allMoviesChosen == false {
                    returnButton.setTitle("Play Again", for: .normal)
                } else {
                    returnButton.isEnabled = false
                    returnButton.setTitle("All Movies Played", for: .normal)
                }
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
        if let currentPoster = moviePosterImage {
            if correct == true {
                moviePoster.image = currentPoster
            }
            colorBackground(poster: currentPoster)
        } else {
            if let title = movieTitle {
                let url = URL(string: "https://theposterdb.com/api/assets/\(posterDict[title]!.randomElement()!)")
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    if let image = UIImage(data: imageData) {
                        moviePosterImage = image
                        if correct == true {
                            moviePoster.image = image
                        }
                        colorBackground(poster: image)
                    }
                }
            }
        }
    }
    
    func colorBackground(poster: UIImage) {
        if let color = backgroundColor {
            view.backgroundColor = color
        } else {
            let averageColor = AverageColorFromImage(poster)
            let lighter = averageColor.lighten(byPercentage: 0.2)
            let darker = averageColor.darken(byPercentage: 0.2)
            backgroundColor = GradientColor(UIGradientStyle.topToBottom, frame: view.frame, colors: [averageColor, lighter!, darker!])
            view.backgroundColor = backgroundColor
        }
    }
    
}
