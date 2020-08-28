//
//  MovieExamples.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/26/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation

private var backToTheFuture = Movie(t: "Back to the Future", y: "1985", g1: "Adventure", g2: "Sci-Fi", s: "1955: Hill Valley, California", a1: "Michael J. Fox", a2: "Christopher Lloyd", a3: "Crispin Glover", c1: "Marty McFly", c2: "Dr. Emmett Brown", c3: "Biff Tannen", d: "Robert Zemeckis", p: "A high school student is accidentally sent thirty years into the past in a time-traveling car invented by his close friend.", q: "Roads? Where we're going, we don't need roads.", tg: "He's the only kid ever to get into trouble before he was born.")

private var dieHard = Movie(t: "Die Hard", y: "1988", g1: "Action", g2: "Thriller", s: "1980's: Los Angeles", a1: "Bruce Willis", a2: "Alan Rickman", a3: "Reginald VelJohnson", c1: "John McClane", c2: "Sgt. Al Powell", c3: "Hans Gruber", d: "John McTiernan", p: "An NYPD officer tries to save his wife and several others taken hostage by terrorists during a Christmas party in Los Angeles.", q: "Yippee-ki-yay, motherfucker.", tg: "40 Stories. Twelve Terrorists. One Cop.")

private var bladeRunner = Movie(t: "Blade Runner", y: "1982", g1: "Sci-Fi", g2: "Noir", s: "November 2019: Los Angeles", a1: "Harrison Ford", a2: "Rutger Hauer", a3: "Edward James Olmos", c1: "Rick Deckard", c2: "Roy Batty", c3: "Dr. Eldon Tyrell", d: "Ridley Scott", p: "A policemen must pursue and terminate four robots who stole a ship in space, and have returned to Earth to find their creator.", q: "Quite an experience to live in fear, isn't it? That's what it is to be a slave.", tg: "Man has made his match ... now it's his problem")

var listOfMovies = [backToTheFuture, dieHard, bladeRunner]

var posterDict = ["Back to the Future": [64517], "Die Hard": [16120], "Blade Runner": [15041]]

//var fullMovieList = ["Back to the Future", "Se7en", "Die Hard", "Star Wars: Episode IV - A New Hope", "Star Wars: Episode V - The Empire Strikes Back", "Star Wars: Episode V - Return of the Jedi", "Blade Runner", "Alien", "Life of Brian", "Parasite", "Taxi Driver", "Her", "Hereditary", "The Matrix", "There Will Be Blood", "WALL-E", "Do the Right Thing", "Psycho", "Get Out", "Galaxy Quest", "Toy Story", "Toy Story 2", "Toy Story 3", "Toy Story 4", "Ex Machina", "Jaws", "The Incredibles", "21 Jump Street", "The Big Short", "Goodfellas", "Holes", "Fargo", "Uncut Gems", "Dunkirk", "Black Hawk Down", "Spotlight", "The Dark Knight", "Tropic Thunder", "Inception", "Coco"]

var fullMovieList = [String]()

func createMovieList() {
    for movie in listOfMovies {
        fullMovieList.append(movie.facts[0])
    }
}

var movieNums = Array(0...listOfMovies.count - 1)

func chooseMovie() -> (Movie, Bool) {
    if let index = movieNums.randomElement() {
        movieNums.removeAll(where: { $0 == index })
        let isDone = movieNums.count == 0
        return (listOfMovies[index], isDone)
    }
    fatalError("Picked movie from empty list")
}
