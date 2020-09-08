//
//  LoadMovies.swift
//  Pass the Popcorn
//
//  Created by Amar Saraon on 9/2/20.
//  Copyright © 2020 Amar Saraon. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()
let defaults = UserDefaults.standard
var points = defaults.integer(forKey: K.pointsKey)

//MARK: - Load Movies Method

func loadMovies(realmMovies: Results<MovieData>) {
    for i in 0...listOfMovies.count - 1 {
        for movie in listOfMovies[i] {
            let movieNames = realmMovies.filter("movieName == %@", movie.facts[0])
            if movieNames.count == 0 {
                do {
                    try realm.write {
                        realm.add(MovieData(movie.facts[0], i))
                    }
                } catch {
                    print("Error adding movies to realm, \(error)")
                }
            }
        }
    }
}

func updateMovies(movieName: String) {
    let chosenMovie = realm.objects(MovieData.self).filter("movieName == %@", movieName)[0]
    do {
        try realm.write {
            chosenMovie.done = true
        }
    } catch {
        print("Error saving done status, \(error)")
    }
}
