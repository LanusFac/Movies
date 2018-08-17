//
//  Movie.swift
//  Movies
//
//  Created by Facundo Lanùs on 15/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var id: NSNumber
    var voteCount: NSNumber
    var voteAvarage: Double
    var popularity: Double
    var posterPath: String
    var originalLenguage: String
    var originalTitle: String
    var genresIds: [Int]
    var backdropPath: String
    var overview: String
    var adult: Bool
    var releaseDate: String
    var cast: [Actor] = []
    
    init (dictionary: [String: AnyObject]) {
        self.title = dictionary["title"] as? String ?? "No title information."
        self.id = dictionary["id"] as? NSNumber ?? -1
        self.voteCount = dictionary["vote_count"] as? NSNumber ?? 0
        self.voteAvarage = dictionary["vote_average"] as? Double ?? -1.0
        self.popularity = dictionary["popularity"] as? Double ?? -1.0
        self.posterPath = dictionary["poster_path"] as? String ?? "No poster path info"
        self.originalTitle = dictionary["original_title"] as? String ?? "No original title info"
        self.originalLenguage = dictionary["original_language"] as? String ?? "No original languege info"
        self.genresIds = dictionary["genre_ids"] as? [Int] ?? []
        self.backdropPath = dictionary["backdrop_path"] as? String ?? "No backdrop path info"
        self.overview = dictionary["overview"] as? String ?? "No overview"
        self.adult = dictionary["adult"] as? Bool ?? true
        self.releaseDate = dictionary["release_date"] as? String ?? "No release date info"
    }
}
