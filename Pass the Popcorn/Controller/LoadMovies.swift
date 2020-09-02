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

//MARK: - Load Movies Method

func loadMovies(realmMovies: Results<MovieData>) {
    for movie in listOfMovies {
        let movieNames = realmMovies.filter("movieName == %@", movie.facts[0])
        if movieNames.count == 0 {
            do {
                try realm.write {
                    realm.add(MovieData(movie.facts[0]))
                }
            } catch {
                print("Error adding movies to realm, \(error)")
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
