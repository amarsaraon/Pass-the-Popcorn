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

private var theSocialNetwork = Movie(t: MovieNames.theSocialNetwork.rawValue, y: "2010", g1: "Biography", g2: "Drama", s: "Early 2000's USA", a1: "Jesse Eisenberg", a2: "Andrew Garfield", a3: "Justin Timberlake", c1: "Mark Zuckerberg", c2: "Eduardo Saverin", c3: "Dustin Moskovitz", d: "David Fincher", p: "As a college student creates a social networking site he is sued by the twins who claimed he stole their idea and by the co-founder who was later squeezed out of the business.", q: "You better lawyer up asshole, because I'm not coming back for 30%, I'm coming back for everything.")

private var jurassicWorld = Movie(t: MovieNames.jurassicWorld.rawValue, y: "2015", g1: "Action", g2: "Sci-Fi", s: "Fictional Central American island of Isla Nublar", a1: "Chris Pratt", a2: "Bryce Dallas Howard", a3: "Vincent D'Onofrio", c1: "Owen Grady", c2: "Claire Dearing", c3: "Henry Wu", d: "Colin Trevorrow", p: "A new theme park creates a genetically modified hybrid dinosaur which escapes containment and goes on a killing spree.", q: "Animals raised in isolation aren't always the most functional.")

private var avatar = Movie(t: MovieNames.avatar.rawValue, y: "2009", g1: "Action", g2: "Fantasy", s: "Fictional Planet Pandora", a1: "Sam Worthington", a2: "Zoe Saldana", a3: "Sigourney Weaver", c1: "Jake Sully", c2: "Neytiri", c3: "Colonel Miles Quaritch", d: "James Cameron", p: "A paraplegic Marine dispatched to a unique mission becomes torn between following his orders and protecting the world he feels is his home.", q: "Now that I have seen the horrors of space mining, I’m not just blue on the outside.")

private var frozen = Movie(t: MovieNames.frozen.rawValue, y: "2013", g1: "Fantasy", g2: "Animation", s: "Fictional Kingdom Arendelle", a1: "Kristen Bell", a2: "Idina Menzel", a3: "Jonathan Groff", c1: "Anna", c2: "Elsa", c3: "Olaf", d: "Chris Buck and Jennifer Lee", p: "When the newly crowned accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.", q: "Do you want to build a snowman?")

private var spiderman = Movie(t: MovieNames.spiderman.rawValue, y: "2002", g1: "Action", g2: "Superhero", s: "New York City", a1: "Tobey Maguire", a2: "James Franco", a3: "Willem Dafoe", c1: "Peter Parker", c2: "Norman Osborn", c3: "Mary Jane Watson", d: "Sam Raimi", p: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.", q: "With great power comes great responsibility.")

private var jumanji = Movie(t: MovieNames.jumanji.rawValue, y: "2017", g1: "Adventure", g2: "Comedy", s: "Digital Jungle via Brantford, New Hampshire", a1: "Dwayne Johnson", a2: "Kevin Hart", a3: "Jack Black", c1: "Spencer", c2: "Fridge", c3: "Martha", d: "Jake Kasdan", p: "Four teenagers are sucked into a magical video game, and the only way they can escape is to work together to finish the game.", q: "Who you are... in this moment of time... and who you want to be. You get one life. You decide how you're gonna spend it. Fortunately... there is no better place for self-reflection... than detention.")

private var oceansEleven = Movie(t: MovieNames.oceansEleven.rawValue, y: "2002", g1: "Crime", g2: "Heist", s: "Las Vegas", a1: "George Clooney", a2: "Brad Pitt", a3: "Matt Damon", c1: "Danny Ocean", c2: "Linus Caldwell", c3: "Terry Benedict", d: "Steven Soderbergh", p: "A released convict and his ten accomplices plan to rob three Las Vegas casinos simultaneously.", q: "You'd need at least a dozen guys doing a combination of cons.")

private var ironMan = Movie(t: MovieNames.ironMan.rawValue, y: "2008", g1: "Action", g2: "Superhero", s: "Afghanistan and California", a1: "Robert Downey Jr.", a2: "Jeff Bridges", a3: "Gwyneth Paltrow", c1: "Tony Stark", c2: "Pepper Potts", c3: "Obadiah Stane", d: "Jon Favreau", p: "After being held captive in an Afghan cave, billionaire engineer creates a unique weaponized suit of armor to fight evil.", q: "That's kind of catchy. It's got a nice ring to it. I mean it's not technically accurate. The suit's a gold titanium alloy, but it's kind of provocative, the imagery anyway.")

private var riseOfThePlanetOfTheApes = Movie(t: MovieNames.riseOfThePlanetOfTheApes.rawValue, y: "2011", g1: "Action", g2: "Sci-Fi", s: "San Francisco", a1: "Andy Serkis", a2: "James Franco", a3: "John Lithglow", c1: "Caesar", c2: "Maurice", c3: "Koba", d: "Rupert Wyatt", p: "A substance designed to help the brain repair itself gives advanced intelligence to a chimpanzee who leads an ape uprising.", q: "Take your stinking paw off me, you damn dirty ape!")

private var piratesOfTheCaribbean = Movie(t: MovieNames.piratesOfTheCaribbean.rawValue, y: "2003", g1: "Adventure", g2: "Fantasy", s: "The High Seas", a1: "Johnny Depp", a2: "Orlando Bloom", a3: "Keira Knightley", c1: "Jack Sparrow", c2: "Will Turner", c3: "Elizabeth Swann", d: "Gore Verbinski", p: "A blacksmith teams up with eccentric pirate to save his love, the governor's daughter, from former pirates who are now undead.", q: "Not all treasure is silver and gold, mate.")

private var deadpool = Movie(t: MovieNames.deadpool.rawValue, y: "2016", g1: "Superhero", g2: "Comedy", s: "New York City", a1: "Ryan Reynolds", a2: "T.J. Miller", a3: "Morena Baccarin", c1: "Wade Wilson", c2: "Ajax", c3: "Colossus", d: "Tim Miller", p: "A wisecracking mercenary gets experimented on and becomes immortal but ugly, and sets out to track down the man who ruined his looks.", q: "Fourth wall break inside of a fourth wall break? That's like... 16 walls!")

private var kingKong = Movie(t: MovieNames.kingKong.rawValue, y: "2005", g1: "Adventure", g2: "Action", s: "Skull Island", a1: "Naomi Watts", a2: "Jack Black", a3: "Adrien Brody", c1: "Ann Darrow", c2: "Carl Denham", c3: "Jack Driscoll", d: "Peter Jackson", p: "A greedy film producer assembles a team of moviemakers and sets out for the infamous in the Indian Ocean, where they find more than just cannibalistic natives.", q: "It wasn't the airplanes. It was Beauty killed the Beast.")

private var wreckItRaplh = Movie(t: MovieNames.wreckItRalph.rawValue, y: "2012", g1: "Adventure", g2: "Animation", s: "Litwik's Arcade", a1: "John C. Reilly", a2: "Sarah Silverman", a3: "Jack McBrayer", c1: "Ralph", c2: "Vanellope von Schweetz", c3: "King Candy", d: "Rich Moore", p: "A video game villain wants to be a hero and sets out to fulfill his dream, but his quest brings havoc to the whole arcade where he lives.", q: "I'm bad, and that's good! I will never be good, and that's not bad!")

private var harryPotterSS = Movie(t: MovieNames.harryPotterSS.rawValue, y: "2001", g1: "Adventure", g2: "Fantasy", s: "Hogwarts School of Witchcraft and Wizardry", a1: "Daniel Radcliffe", a2: "Rupert Grint", a3: "Emma Watson", c1: "Harry Potter", c2: "Ron Weasley", c3: "Hermione Granger", d: "Chris Columbus", p: "An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.", q: "It takes a great deal of bravery to stand up to your enemies, but a great deal more to stand up to your friends.")

private var ratatouille = Movie(t: MovieNames.ratatouille.rawValue, y: "2007", g1: "Animation", g2: "Comedy", s: "Paris", a1: "Patton Oswalt", a2: "Lou Romano", a3: "Brad Garrett", c1: "Remy", c2: "Linguini", c3: "Anton Ego", d: "Brad Bird", p: "A rat who can cook makes an unusual alliance with a young kitchen worker at a famous restaurant.", q: "Anyone can cook!")

private var threeHundred = Movie(t: MovieNames.threeHundred.rawValue, y: "2007", g1: "Action", g2: "Historical Fiction", s: "Ancient Greece", a1: "Gerard Butler", a2: "Lena Headey", a3: "Michael Fassbender", c1: "King Leonidas", c2: "Queen Gorgo", c3: "Theron", d: "Zack Snyder", p: "A king leads his small army against an invading army of 1000 time its size", q: "This is Sparta!")

private var theHungerGames = Movie(t: MovieNames.theHungerGames.rawValue, y: "2012", g1: "Action", g2: "Dystopian", s: "Post-apocalyptic nation of Panem, located in North America", a1: "Jennifer Lawrence", a2: "Josh Hutcherson", a3: "Woody Harrelson", c1: "Katniss Everdeen", c2: "Peeta Mellark", c3: "Haymitch Abernathy", d: "Gary Ross", p: "A girl voluntarily takes her younger sister's place in a reality show in which teenagers chosen at random to fight to the death.", q: "May the odds be ever in your favor")

private var suicideSquad = Movie(t: MovieNames.suicideSquad.rawValue, y: "2016", g1: "Action", g2: "Superhero", s: "Belle Reve Penitentiary", a1: "Margot Robbie", a2: "Will Smith", a3: "Viola Davis", c1: "Deadshot", c2: "Harley Quinn", c3: "Killer Croc", d: "David Ayer", p: "A secret government agency recruits some of the most dangerous incarcerated super-villains to form a defensive task force.", q: "We're bad guys that's what we do.")

private var nightAtTheMusuem = Movie(t: MovieNames.nightAtTheMusuem.rawValue, y: "2006", g1: "Family", g2: "Adventure", s: "Museum of Natural History", a1: "Ben Stiller", a2: "Robin Williams", a3: "Dick Van Dyke", c1: "Larry Daley", c2: "Rexy", c3: "Teddy Roosevelt", d: "Shawn Levy", p: "A newly recruited night security guard at musuem discovers that an ancient curse causes the animals and exhibits on display to come to life and wreak havoc.", q: "Some men are born great, others have greatness thrust upon them.")

private var it = Movie(t: MovieNames.it.rawValue, y: "2017", g1: "Horror", g2: "Mystery", s: "1989: Derry, Maine", a1: "Bill Skarsgård", a2: "Finn Wolfhard", a3: "Sophia Lillis", c1: "Beverly Marsh", c2: "Henry Bowers", c3: "Bill Denbrough", d: "Andy Muschietti", p: "A group of bullied kids band together to destroy a shape-shifting monster, which disguises itself as a clown and preys on the children of their town.", q: "Welcome to the Loser's Club, asshole!")

private var theLegoMovie = Movie(t: MovieNames.theLegoMovie.rawValue, y: "2014", g1: "Family", g2: "Animation", s: "Bricksburg", a1: "Chris Pratt", a2: "Will Arnett", a3: "Will Ferrell", c1: "Emmet", c2: "Batman", c3: "President Business", d: "Phil Lord and Christopher Miller", p: "An ordinary  construction worker, thought to be the prophesied as special, is recruited to join a quest to stop an evil tyrant from gluing the universe into eternal stasis.", q: "Everything Is Awesome")

private var theFastAndTheFurious = Movie(t: MovieNames.theFastAndTheFurious.rawValue, y: "2001", g1: "Crime", g2: "Action", s: "Los Angeles", a1: "Paul Walker", a2: "Vin Diesel", a3: "Michelle Rodriguez", c1: "Brian O'Conner", c2: "Dominic Toretto", c3: "Letty", d: "Rob Cohen", p: "A police officer must decide where his loyalty really lies when he becomes enamored with the street racing world he has been sent undercover to destroy.", q: "I live my life a quarter mile at a time. Nothing else matters: not the mortgage, not the store, not my team and all their bullshit. For those ten seconds or less, I'm free.")

private var transformers = Movie(t: MovieNames.transformers.rawValue, y: "2007", g1: "Action", g2: "Sci-Fi", s: "Fictional Mission City", a1: "Shia LaBeouf", a2: "Megan Fox", a3: "Josh Duhamel", c1: "Sam Witwicky", c2: "Optimus Prime", c3: "Megatron", d: "Michael Bay", p: "An ancient struggle between two races, comes to Earth, with a clue to the ultimate power held by a teenager.", q: "With the All Spark gone, we cannot return life to our planet. And fate has yielded its reward: a new world to call home. We live among its people now, hiding in plain sight, but watching over them in secret, waiting, protecting.")

private var coco = Movie(t: MovieNames.coco.rawValue, y: "2017", g1: "Animation", g2: "Adventure", s: "The Land of the Dead", a1: "Anthony Gonzalez", a2: "Gael García Bernal", a3: "Benjamin Bratt", c1: "Miguel", c2: "Héctor", c3: "Ernesto de la Cruz", d: "Lee Unkrich and Adrian Molina", p: "An aspiring musician, confronted with his family's ancestral ban on music, attempts to find his great-great-grandfather, a legendary singer.", q: "He's been forgotten. When there's no one left in the living world who remembers you, you disappear from this world. We call it the Final Death.")

private var theMatrix = Movie(t: MovieNames.theMatrix.rawValue, y: "1999", g1: "Action", g2: "Sci-Fi", s: "An unnamed US megacity in a virtual world", a1: "Keanu Reeves", a2: "Laurence Fishburne", a3: "Hugo Weaving", c1: "Neo", c2: "Morpheus", c3: "Agent Smith", d: "Lana Wachowski and Lilly Wachowski", p: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", q: "This is your last chance. After this, there is no turning back. You take the blue pill - the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill - you stay in Wonderland and I show you how deep the rabbit-hole goes.")

private var rocky = Movie(t: MovieNames.rocky.rawValue, y: "1979", g1: "Drama", g2: "Sports", s: "Philadelphia", a1: "Sylvester Stallone", a2: "Burt Young", a3: "Carl Weathers", c1: "Adrian", c2: "Paulie", c3: "Apollo", d: "John G. Avildsen", p: "A small-time boxer gets a supremely rare chance to fight a heavy-weight champion in a bout in which he strives to go the distance for his self-respect.", q: "But it ain't how hard you hit; it's about how hard you can get hit, and keep moving forward.")

private var homeAlone = Movie(t: MovieNames.homeAlone.rawValue, y: "1990", g1: "Comedy", g2: "Family", s: "Chicago Suburb", a1: "Macaulay Culkin", a2: "Joe Pesci", a3: "Catherine O'Hara", c1: "Kevin", c2: "Harry", c3: "Marv", d: "Chris Columbus", p: "An eight-year-old troublemaker must protect his house from a pair of burglars when he is accidentally left by his family during Christmas vacation.", q: "KEVIN!")

private var alien = Movie(t: MovieNames.alien.rawValue, y: "1979", g1: "Sci-FI", g2: "Horror", s: "Commercial Starship Nostromo", a1: "Sigourney Weaver", a2: "Tom Skerritt", a3: "Ian Holm", c1: "Ellen Ripley", c2: "Arthur Dallas", c3: "Thomas Kane", d: "Ridley Scott", p: "After a space merchant vessel receives an unknown transmission as a distress call, one of the crew is attacked by a mysterious life form and they soon realize that its life cycle has merely begun.", q: "Tagline: In space no one can hear you scream")

private var raidersOfTheLostArk = Movie(t: MovieNames.raidersOfTheLostArk.rawValue, y: "1981", g1: "Adventure", g2: "Action", s: "1936 Peru, Nepal, Egypt, and Berlin", a1: "Harrison Ford", a2: "Karen Allen", a3: "Paul Freeman", c1: "Indiana Jones", c2: "Marion Ravenwood", c3: "René Belloq", d: "Steven Spielberg", p: "An archaeologist is hired by the U.S. government to find an object before the Nazis can obtain it.", q: "Snakes. Why'd it have to be snakes?")

private var theKarateKid = Movie(t: MovieNames.theKarateKid.rawValue, y: "1984", g1: "Sports", g2: "Coming-of-Age", s: "Los Angeles", a1: "Ralph Macchio", a2: "Pat Morita", a3: "Elisabeth Shue", c1: "Daniel LaRusso", c2: "Mr. Miyagi", c3: "Johnny Kreese", d: "John G. Avildsen", p: "A martial arts master agrees to teach a bullied teenager to defend himself.", q: "Wax on, wax off.")

private var independenceDay = Movie(t: MovieNames.independenceDay.rawValue, y: "1996", g1: "Sci-Fi", g2: "Action", s: "New York, Washington D.C., and the Nevada Desert", a1: "Will Smith", a2: "Jeff Goldblum", a3: "Bill Pullman", c1: "President Whitmore", c2: "Captain Steven Hiller", c3: "David Levinson", d: "Roland Emmerich", p: "The aliens are coming and their goal is to invade and destroy Earth. Fighting superior technology, mankind's best weapon is the will to survive.", q: "And should we win the day, the Fourth of July will no longer be known as an American holiday, but as the day the world declared in one voice: \"We will not go quietly into the night!\"")

private var newBB = [blackPanther, theDarkKnight, jurassicWorld, avatar, frozen, spiderman, jumanji, oceansEleven, ironMan, riseOfThePlanetOfTheApes, piratesOfTheCaribbean, deadpool, kingKong, wreckItRaplh, harryPotterSS, ratatouille, threeHundred, theHungerGames, suicideSquad, nightAtTheMusuem, it, theLegoMovie, theFastAndTheFurious, transformers, coco]
private var modernClassics = [backToTheFuture, toyStory, dieHard, bladeRunner, jaws, theMatrix, rocky, homeAlone, alien, raidersOfTheLostArk, theKarateKid, independenceDay]
private var newClassics = [getOut, theSocialNetwork]
private var greatComedies = [lifeOfBrian]

var listOfMovies = [newBB, modernClassics, newClassics, greatComedies]

var categoryNames = ["21st Century Blockbusters", "1975-1999 Blockbusters", "21st Century Classics", "Great Comedies"]

var categoryPoints = ["21st Century Blockbusters": 0, "1975-1999 Blockbusters": 2, "21st Century Classics": 4, "Great Comedies": 6] // for testing
// var categoryPoints = ["21st Century Blockbusters": 0, "1975-1999 Classics": 25, "21st Century Greats": 50, "Great Comedies": 75]

var posterDict = [MovieNames.backToTheFuture.rawValue: 64517, MovieNames.dieHard.rawValue: 16120, MovieNames.bladeRunner.rawValue: 15041, MovieNames.toyStory.rawValue: 9911, MovieNames.blackPanther.rawValue: 6915, MovieNames.jaws.rawValue: 8289, MovieNames.theDarkKnight.rawValue: 21708, MovieNames.getOut.rawValue: 12708, MovieNames.lifeOfBrian.rawValue: 15090, MovieNames.theSocialNetwork.rawValue: 64097, MovieNames.jurassicWorld.rawValue: 7006, MovieNames.avatar.rawValue: 24287, MovieNames.frozen.rawValue: 33038, MovieNames.spiderman.rawValue: 21559, MovieNames.jumanji.rawValue: 46698, MovieNames.oceansEleven.rawValue: 35876, MovieNames.ironMan.rawValue: 1923, MovieNames.riseOfThePlanetOfTheApes.rawValue: 4825, MovieNames.piratesOfTheCaribbean.rawValue: 17314, MovieNames.deadpool.rawValue: 84027, MovieNames.kingKong.rawValue: 92411, MovieNames.wreckItRalph.rawValue: 6372, MovieNames.harryPotterSS.rawValue: 20344, MovieNames.ratatouille.rawValue: 501, MovieNames.threeHundred.rawValue: 12814, MovieNames.theHungerGames.rawValue: 6978, MovieNames.suicideSquad.rawValue: 48245, MovieNames.nightAtTheMusuem.rawValue: 865, MovieNames.it.rawValue: 49527, MovieNames.theLegoMovie.rawValue: 46060, MovieNames.theFastAndTheFurious.rawValue: 38958, MovieNames.transformers.rawValue: 14176, MovieNames.coco.rawValue: 512, MovieNames.theMatrix.rawValue: 54008, MovieNames.rocky.rawValue: 56358, MovieNames.homeAlone.rawValue: 50688, MovieNames.alien.rawValue: 27062, MovieNames.raidersOfTheLostArk.rawValue: 17576, MovieNames.theKarateKid.rawValue: 107164, MovieNames.independenceDay.rawValue: 15118]

//var fullMovieList = ["Back to the Future", "Se7en", "Die Hard", "Star Wars: Episode IV - A New Hope", "Star Wars: Episode V - The Empire Strikes Back", "Star Wars: Episode V - Return of the Jedi", "Blade Runner", "Alien", "Life of Brian", "Parasite", "Taxi Driver", "Her", "Hereditary", "The Matrix", "There Will Be Blood", "WALL-E", "Do the Right Thing", "Psycho", "Get Out", "Galaxy Quest", "Toy Story", "Toy Story 2", "Toy Story 3", "Toy Story 4", "Ex Machina", "Jaws", "The Incredibles", "21 Jump Street", "The Big Short", "Goodfellas", "Holes", "Fargo", "Uncut Gems", "Dunkirk", "Black Hawk Down", "Spotlight", "The Dark Knight", "Tropic Thunder", "Inception", "Coco", "Black Panther"]

var fullMovieList = [String]()

func makeFullMovieList() {
    for name in MovieNames.allCases {
        fullMovieList.append(name.rawValue)
    }
}

let pointsDict = [3: 5, 4: 3, 5: 2, 6: 1]

// 1. add to MovieNames.swift
// 2. create private var
// 3. add to category list
// 4. find to poster number and add to posterDict


