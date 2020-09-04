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
    let filePath = "https://theposterdb.com/api/assets/";
    var moviePosterImage: UIImage?
    var backgroundColor: UIColor?
    var textColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        getPoster()
        setUpScreen()
        returnButton.layer.cornerRadius = returnButton.frame.size.height / 5
    }
    
    func setUpScreen() {
        if let title = movieTitle {
            if correct! == true {
                correctLabel.text = "Correct!"
                movieLabel.text = title
                returnButton.setTitle(K.ResultButtonLabels.playAgain, for: .normal)
                updateMovies(movieName: movieTitle!)
            } else {
                correctLabel.text = "Incorrect :("
                movieLabel.text = ""
                returnButton.setTitle(K.ResultButtonLabels.guessAgain, for: .normal)
            }
        }
    }

    @IBAction func returnButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == K.ResultButtonLabels.playAgain {
            backTwo()
        } else {
            navigationController?.popViewController(animated: true)
        }
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
            changeLabelColor(color: textColor!)
        } else {
            let averageColor = AverageColorFromImage(poster)
            let lighter = averageColor.lighten(byPercentage: 0.2)
            let darker = averageColor.darken(byPercentage: 0.2)
            backgroundColor = GradientColor(UIGradientStyle.topToBottom, frame: view.frame, colors: [averageColor, lighter!, darker!])
            if let color = backgroundColor {
                view.backgroundColor = color
                textColor = ContrastColorOf(color, returnFlat: true)
                if let colorTwo = textColor {
                    changeLabelColor(color: colorTwo)
                }
            }
        }
    }
    
    func changeLabelColor(color: UIColor) {
        correctLabel.textColor = textColor
        movieLabel.textColor = textColor
    }
    
    func backTwo() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
}
