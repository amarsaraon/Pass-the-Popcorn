//
//  MovieExamples.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 8/26/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation

private var backToTheFuture = Movie(t: MovieNames.backToTheFuture.rawValue, y: "1985", g1: "Adventure", g2: "Sci-Fi", s: "1955: Hill Valley, California", a1: "Michael J. Fox", a2: "Christopher Lloyd", a3: "Crispin Glover", c1: "Marty McFly", c2: "Dr. Emmett Brown", c3: "Biff Tannen", d: "Robert Zemeckis", p: "A high school student is accidentally sent thirty years into the past in a time-traveling car invented by his close friend.", q: "Roads? Where we're going, we don't need roads.")

private var dieHard = Movie(t: MovieNames.dieHard.rawValue, y: "1988", g1: "Action", g2: "Thriller", s: "Los Angeles", a1: "Bruce Willis", a2: "Alan Rickman", a3: "Reginald VelJohnson", c1: "John McClane", c2: "Sgt. Al Powell", c3: "Hans Gruber", d: "John McTiernan", p: "An NYPD officer tries to save his wife and several others taken hostage by terrorists during a Christmas party in Los Angeles.", q: "Yippee-ki-yay, motherfucker.")

private var bladeRunner = Movie(t: MovieNames.bladeRunner.rawValue, y: "1982", g1: "Sci-Fi", g2: "Noir", s: "Los Angeles", a1: "Harrison Ford", a2: "Rutger Hauer", a3: "Edward James Olmos", c1: "Rick Deckard", c2: "Roy Batty", c3: "Dr. Eldon Tyrell", d: "Ridley Scott", p: "A policemen must pursue and terminate four robots who stole a ship in space, and have returned to Earth to find their creator.", q: "Quite an experience to live in fear, isn't it? That's what it is to be a slave.")

private var toyStory = Movie(t: MovieNames.toyStory.rawValue, y: "1995", g1: "Animation", g2: "Adventure", s: "San Francisco Bay Area", a1: "Tom Hanks", a2: "Tim Allen", a3: "Annie Potts", c1: "Woody", c2: "Buzz Lightyear", c3: "Andy", d: "John Lassiter", p: "A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room.", q: "To infinity and beyond")

private var blackPanther = Movie(t: MovieNames.blackPanther.rawValue, y: "2018", g1: "Action", g2: "Superhero", s: "Wakanda", a1: "Chadwick Boseman", a2: "Michael B. Jordan", a3: "Lupita Nyong'o", c1: "T'Challa", c2: "Erik Killmonger", c3: "Shuri", d: "Ryan Coogler", p: "An heir to a hidden but advanced kingdom must step forward to lead his people into a new future and must confront a challenger from his country's past.", q: "Wakanda forever!")

private var theDarkKnight = Movie(t: MovieNames.theDarkKnight.rawValue, y: "2008", g1: "Action", g2: "Crime", s: "Gotham City", a1: "Christian Bale", a2: "Heath Ledger", a3: "Aaron Eckhart", c1: "Bruce Wayne", c2: "Joker", c3: "Harvey Dent", d: "Christopher Nolan", p: "When the menace wreaks havoc and chaos on a city, a vigilante must accept one of the greatest psychological and physical tests of his ability to fight injustice.", q: "Why so serious?")

private var jaws = Movie(t: MovieNames.jaws.rawValue, y: "1975", g1: "Action", g2: "Thriller", s: "Amity Island", a1: "Roy Scheider", a2: "Robert Shaw", a3: "Richard Dreyfuss", c1: "Brody", c2: "Quint", c3: "Hooper", d: "Steven Spielberg", p: "When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.", q: "You're gonna need a bigger boat.")

private var getOut = Movie(t: MovieNames.getOut.rawValue, y: "2017", g1: "Horror", g2: "Mystery", s: "Upstate New York", a1: "Daniel Kaluuya", a2: "Bradley Whitford", a3: "Catherine Keener", c1: "Chris Washington", c2: "Rod Williams", c3: "Rose Armitage", d: "Jordan Peele", p: "A young African-American visits his white girlfriend's parents for the weekend, where his simmering uneasiness about their reception of him eventually reaches a boiling point.", q: "By the way, I would have voted for Obama for a third term, if I could.")

private var lifeOfBrian = Movie(t: MovieNames.lifeOfBrian.rawValue, y: "1979", g1: "Satire", g2: "Historical Fiction", s: "Year 0: Roman Province of Judea", a1: "John Cleese", a2: "Graham Chapman", a3: "Eric Idle", c1: "Stan (Loretta)", c2: "Brian Cohen", c3: "Biggus Dickus", d: "Terry Gilliam", p: "A man born on the original Christmas in the stable next door to Jesus Christ must spends his life being mistaken for a messiah.", q: "All right, but apart from the sanitation, medicine, education, wine, public order, irrigation, roads, the fresh water system and public health, what have the Romans ever done for us?")

private var newBB = [blackPanther, theDarkKnight]
private var modernClassics = [backToTheFuture, toyStory, dieHard, bladeRunner]
private var newClassics = [getOut]
private var greatComedies = [lifeOfBrian]

var listOfMovies = [newBB, modernClassics, newClassics, greatComedies]

var categoryNames = ["21st Century Blockbusters", "1975-1999 Classics", "21st Century Greats", "Great Comedies"]

var posterDict = [MovieNames.backToTheFuture.rawValue: [64517], MovieNames.dieHard.rawValue: [16120], MovieNames.bladeRunner.rawValue: [15041], MovieNames.toyStory.rawValue: [9911], MovieNames.blackPanther.rawValue: [6915], MovieNames.jaws.rawValue: [8289], MovieNames.theDarkKnight.rawValue: [21708], MovieNames.getOut.rawValue: [12708], MovieNames.lifeOfBrian.rawValue: [15090]]

//var fullMovieList = ["Back to the Future", "Se7en", "Die Hard", "Star Wars: Episode IV - A New Hope", "Star Wars: Episode V - The Empire Strikes Back", "Star Wars: Episode V - Return of the Jedi", "Blade Runner", "Alien", "Life of Brian", "Parasite", "Taxi Driver", "Her", "Hereditary", "The Matrix", "There Will Be Blood", "WALL-E", "Do the Right Thing", "Psycho", "Get Out", "Galaxy Quest", "Toy Story", "Toy Story 2", "Toy Story 3", "Toy Story 4", "Ex Machina", "Jaws", "The Incredibles", "21 Jump Street", "The Big Short", "Goodfellas", "Holes", "Fargo", "Uncut Gems", "Dunkirk", "Black Hawk Down", "Spotlight", "The Dark Knight", "Tropic Thunder", "Inception", "Coco", "Black Panther"]

var fullMovieList = [String]()

func makeFullMovieList() {
    for name in MovieNames.allCases {
        fullMovieList.append(name.rawValue)
    }
}
//var fullMovieList = [MovieNames.backToTheFuture, MovieNames.dieHard, MovieNames.bladeRunner, MovieNames.toyStory, MovieNames.blackPanther, MovieNames.jaws, MovieNames.theDarkKnight, MovieNames.getOut, MovieNames.lifeOfBrian]
